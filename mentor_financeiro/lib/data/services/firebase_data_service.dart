import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/network/connectivity_service.dart';

/// Coleções canônicas: `users/{uid}` (persona + preferências mentor) e
/// `users/{uid}/saved_simulations/{id}` (histórico de simulações).
///
/// Autenticação social/e-mail continua em [FirebaseService]; aqui ficam dados
/// de produto e observabilidade (Analytics / Crashlytics).
class FirebaseDataService {
  FirebaseDataService._();
  static final FirebaseDataService instance = FirebaseDataService._();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  DocumentReference<Map<String, dynamic>> _userRef(String uid) =>
      _db.collection('users').doc(uid);

  /// Crashlytics + handlers globais (mobile/desktop; web desativado).
  Future<void> setupObservability() async {
    if (Firebase.apps.isEmpty) return;

    if (kIsWeb) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      return;
    }

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  void setCrashlyticsUser(String? uid) {
    if (kIsWeb || Firebase.apps.isEmpty) return;
    if (uid == null || uid.isEmpty) {
      FirebaseCrashlytics.instance.setUserIdentifier('');
      return;
    }
    FirebaseCrashlytics.instance.setUserIdentifier(uid);
  }

  Future<void> logAnalyticsEvent(
    String name, [
    Map<String, Object>? parameters,
  ]) async {
    if (Firebase.apps.isEmpty) return;
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
    } catch (e, st) {
      log('Analytics log failed: $e', name: 'mentor.analytics', error: e, stackTrace: st);
    }
  }

  /// Confirma leitura remota em Firestore e um endpoint HTTP leve.
  Future<BootstrapHealthReport> runBootstrapHealthChecks() async {
    var firebaseCoreOk = false;
    var firestoreOk = false;
    var externalHttpOk = false;

    try {
      firebaseCoreOk = Firebase.apps.isNotEmpty;
    } catch (_) {}

    if (firebaseCoreOk) {
      try {
        await _db
            .collection('users')
            .limit(1)
            .get(const GetOptions(source: Source.server));
        firestoreOk = true;
      } catch (e, st) {
        log(
          'Firestore server read check failed: $e',
          name: 'mentor.health',
          error: e,
          stackTrace: st,
        );
      }
    }

    try {
      final response = await http
          .get(Uri.parse('https://www.gstatic.com/generate_204'))
          .timeout(const Duration(seconds: 5));
      externalHttpOk =
          response.statusCode == 204 || response.statusCode == 200;
    } catch (e, st) {
      log(
        'External HTTP probe failed: $e',
        name: 'mentor.health',
        error: e,
        stackTrace: st,
      );
    }

    return BootstrapHealthReport(
      firebaseCore: firebaseCoreOk,
      firestore: firestoreOk,
      externalHttp: externalHttpOk,
    );
  }

  Future<Map<String, dynamic>?> fetchUserMentorProfile(String uid) async {
    if (Firebase.apps.isEmpty) return null;
    await ConnectivityService.requireOnline();
    final snap = await _userRef(uid).get(const GetOptions(source: Source.server));
    if (!snap.exists) return null;
    return snap.data();
  }

  Future<void> upsertUserMentorProfile({
    required String uid,
    required String personaName,
    required bool mentorOnboardingDone,
    required bool mentorPersonaSetupDone,
    required bool mentorTourCompleted,
    String? email,
  }) async {
    if (Firebase.apps.isEmpty) return;
    await ConnectivityService.requireOnline();
    await _userRef(uid).set(
      {
        'uid': uid,
        if (email != null && email.isNotEmpty) 'email': email,
        'persona': personaName,
        'mentorOnboardingDone': mentorOnboardingDone,
        'mentorPersonaSetupDone': mentorPersonaSetupDone,
        'mentorTourCompleted': mentorTourCompleted,
        'updatedAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    );
  }

  /// Persiste uma simulação (ex.: calculadora) em `saved_simulations`.
  Future<String> saveSimulation({
    required String uid,
    required Map<String, dynamic> inputs,
    Map<String, dynamic>? summary,
    String? label,
  }) async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase não inicializado.');
    }
    await ConnectivityService.requireOnline();
    final doc = _userRef(uid).collection('saved_simulations').doc();
    final payload = <String, dynamic>{
      'createdAt': FieldValue.serverTimestamp(),
      'inputs': inputs,
    };
    final trimmedLabel = label?.trim();
    if (trimmedLabel != null && trimmedLabel.isNotEmpty) {
      payload['label'] = trimmedLabel;
    }
    if (summary != null) {
      payload['summary'] = summary;
    }
    await doc.set(payload);
    return doc.id;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> savedSimulationsStream(
    String uid, {
    int limit = 50,
  }) {
    return _userRef(uid)
        .collection('saved_simulations')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots();
  }
}

class BootstrapHealthReport {
  const BootstrapHealthReport({
    required this.firebaseCore,
    required this.firestore,
    required this.externalHttp,
  });

  final bool firebaseCore;
  final bool firestore;
  final bool externalHttp;
}
