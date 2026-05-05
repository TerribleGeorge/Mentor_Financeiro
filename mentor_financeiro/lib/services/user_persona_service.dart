import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_prefs.dart';
import '../core/network/connectivity_service.dart';
import '../data/services/firebase_data_service.dart';
import '../domain/entities/compound_interest_result.dart';
import '../domain/entities/user_persona.dart';
import '../domain/models/mentor_llm_context.dart';

/// Estado reativo do perfil adaptativo + flags do fluxo Mentor v2.
class UserPersonaService extends ChangeNotifier {
  UserPersonaService._();
  static final UserPersonaService instance = UserPersonaService._();
  factory UserPersonaService() => instance;

  static const String prefsKey = 'user_persona';

  UserPersona _persona = UserPersona.novice;
  bool _mentorOnboardingDone = false;
  bool _mentorPersonaSetupDone = false;
  bool _mentorTourCompleted = false;

  UserPersona get persona => _persona;

  bool get mentorOnboardingDone => _mentorOnboardingDone;

  bool get mentorPersonaSetupDone => _mentorPersonaSetupDone;

  /// `true` quando o utilizador ainda não concluiu o tour guiado (prefs + nuvem).
  bool get shouldShowTour => !_mentorTourCompleted;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(prefsKey);
    _persona = _parse(raw) ?? UserPersona.novice;
    _mentorOnboardingDone = prefs.getBool(AppPrefs.mentorOnboardingDone) ?? false;
    _mentorPersonaSetupDone =
        prefs.getBool(AppPrefs.mentorPersonaSetupDone) ?? false;
    _mentorTourCompleted = prefs.getBool(AppPrefs.mentorTourCompleted) ?? false;
    if (Firebase.apps.isNotEmpty) {
      await _pullCloudMentorStateIfPossible(prefs);
    }
    notifyListeners();
  }

  Future<void> _pullCloudMentorStateIfPossible(SharedPreferences prefs) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    if (!await ConnectivityService.isOnline()) return;
    try {
      final data = await FirebaseDataService.instance.fetchUserMentorProfile(uid);
      if (data == null) return;

      final personaRaw = data['persona']?.toString();
      final cloudOnboarding = data['mentorOnboardingDone'] == true;
      final cloudPersonaSetup = data['mentorPersonaSetupDone'] == true;
      final cloudTourDone = data['mentorTourCompleted'] == true;

      var changed = false;
      if (personaRaw != null && personaRaw.isNotEmpty) {
        final parsed = _parse(personaRaw);
        if (parsed != null && parsed != _persona) {
          _persona = parsed;
          await prefs.setString(prefsKey, parsed.name);
          changed = true;
        }
      }
      if (cloudOnboarding && !_mentorOnboardingDone) {
        _mentorOnboardingDone = true;
        await prefs.setBool(AppPrefs.mentorOnboardingDone, true);
        changed = true;
      }
      if (cloudPersonaSetup && !_mentorPersonaSetupDone) {
        _mentorPersonaSetupDone = true;
        await prefs.setBool(AppPrefs.mentorPersonaSetupDone, true);
        changed = true;
      }
      if (cloudTourDone && !_mentorTourCompleted) {
        _mentorTourCompleted = true;
        await prefs.setBool(AppPrefs.mentorTourCompleted, true);
        changed = true;
      }
      if (changed) notifyListeners();
    } catch (_) {}
  }

  Future<void> _syncMentorDocumentToCloud() async {
    if (Firebase.apps.isEmpty) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    if (!await ConnectivityService.isOnline()) return;
    try {
      await FirebaseDataService.instance.upsertUserMentorProfile(
        uid: user.uid,
        personaName: _persona.name,
        mentorOnboardingDone: _mentorOnboardingDone,
        mentorPersonaSetupDone: _mentorPersonaSetupDone,
        mentorTourCompleted: _mentorTourCompleted,
        email: user.email,
      );
    } catch (_) {}
  }

  /// Garante envio imediato do documento `users/{uid}` (ex.: após setup de persona).
  Future<void> flushMentorProfileToCloud() => _syncMentorDocumentToCloud();

  /// Usuários que já concluíram onboarding legado não ficam presos no fluxo v2.
  Future<void> migrateFromLegacyIfNeeded({
    required bool legacyOnboardingComplete,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(AppPrefs.mentorLegacyMigrated) == true) return;

    if (legacyOnboardingComplete) {
      await prefs.setBool(AppPrefs.mentorOnboardingDone, true);
      await prefs.setBool(AppPrefs.mentorPersonaSetupDone, true);
      _mentorOnboardingDone = true;
      _mentorPersonaSetupDone = true;
    }
    await prefs.setBool(AppPrefs.mentorLegacyMigrated, true);
    notifyListeners();
  }

  Future<void> setMentorOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppPrefs.mentorOnboardingDone, true);
    _mentorOnboardingDone = true;
    notifyListeners();
    await _syncMentorDocumentToCloud();
  }

  Future<void> setMentorPersonaSetupComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppPrefs.mentorPersonaSetupDone, true);
    _mentorPersonaSetupDone = true;
    notifyListeners();
    await _syncMentorDocumentToCloud();
  }

  UserPersona? _parse(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    for (final p in UserPersona.values) {
      if (p.name == raw || p.apiId == raw) return p;
    }
    return null;
  }

  Future<void> setPersona(UserPersona value) async {
    if (_persona == value) return;
    _persona = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, value.name);
    notifyListeners();
    await _syncMentorDocumentToCloud();
  }

  /// Marca o tour guiado como concluído (SharedPreferences + Firestore via [_syncMentorDocumentToCloud]).
  Future<void> completeGuidedTour() async {
    if (_mentorTourCompleted) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppPrefs.mentorTourCompleted, true);
    _mentorTourCompleted = true;
    notifyListeners();
    await _syncMentorDocumentToCloud();
  }

  MentorLlmContext compoundLlmContext({
    required CompoundInterestResult result,
    required List<String> heuristicAdvice,
    required String languageCode,
  }) {
    return MentorLlmContext.forCompoundSimulation(
      persona: _persona,
      result: result,
      heuristicAdvice: heuristicAdvice,
      languageCode: languageCode,
    );
  }
}
