import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/subscription_constants.dart';
import '../core/constants/play_store_billing.dart';
import 'app_theme_controller.dart';

class SubscriptionProvider extends ChangeNotifier {
  static const String _ownerEmail = 'george.guimares@gmail.com';

  bool get isOwner {
    final email = FirebaseAuth.instance.currentUser?.email?.trim().toLowerCase();
    return email != null && email == _ownerEmail.toLowerCase();
  }

  bool _isPremium = false;
  bool _simulatePremiumActive = false;
  bool _isLoading = false;
  String? _errorMessage;
  String _currentRegion = 'BR';
  DateTime? _subscriptionEndDate;

  bool get hasUnlockedPremium => _isPremium;

  bool get isPremium => _isPremium;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get currentRegion => _currentRegion;
  DateTime? get subscriptionEndDate => _subscriptionEndDate;

  bool get hasActiveSubscription {
    if (!_isPremium) return false;
    if (_subscriptionEndDate == null) return true;
    return _subscriptionEndDate!.isAfter(DateTime.now());
  }

  bool get _firebaseReady => Firebase.apps.isNotEmpty;

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    await _loadPremiumStatusFallback();
    await _enforcePremiumThemeGate();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _enforcePremiumThemeGate() async {
    if (_isPremium) return;
    final mode = AppThemeController.instance.themeMode;
    if (!mode.requiresPremiumEntitlement) return;
    await AppThemeController.instance.setThemeMode(AppThemeMode.voidTheme);
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> syncPremiumFromCustomerInfo() async {
    await refreshStatus();
    return hasActiveSubscription;
  }

  Future<void> refreshStatus() async {
    if (_simulatePremiumActive) {
      notifyListeners();
      return;
    }
    await _loadPremiumStatusFallback();
    await _enforcePremiumThemeGate();
    notifyListeners();
  }

  Future<void> _loadPremiumStatusFallback() async {
    if (_simulatePremiumActive) return;

    final prefs = await SharedPreferences.getInstance();
    try {
      if (!_firebaseReady) {
        _isPremium = prefs.getBool('is_premium') ?? false;
      } else {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          _isPremium = prefs.getBool('is_premium') ?? false;
        } else {
          try {
            final doc = await FirebaseFirestore.instance
                .collection('usuarios')
                .doc(user.uid)
                .get();

            if (doc.exists) {
              final data = doc.data();
              _isPremium = data?['isPremium'] ?? false;
              if (data?['premiumEndDate'] != null) {
                _subscriptionEndDate =
                    (data!['premiumEndDate'] as Timestamp).toDate();
              }
            } else {
              _isPremium = prefs.getBool('is_premium') ?? false;
            }
          } catch (e) {
            debugPrint('Erro ao carregar status premium: $e');
            _isPremium = prefs.getBool('is_premium') ?? false;
          }
        }
      }
    } finally {
      await AppThemeController.instance.setPremiumStatus(_isPremium);
    }
  }

  Future<bool> _launchPlayUri(Uri uri) async {
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok) {
        _errorMessage = 'Não foi possível abrir a Play Store.';
        notifyListeners();
        return false;
      }
      _errorMessage = null;
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Abre a ficha da app na Play Store para subscrever (produtos definidos na Play Console).
  Future<bool> purchaseMonthly() async => openPlayStoreListing();

  Future<bool> purchaseYearly() async => openPlayStoreListing();

  Future<bool> purchaseLifetime() async => openPlayStoreListing();

  Future<bool> openPlayStoreListing() async {
    notifyListeners();
    return _launchPlayUri(PlayStoreBilling.appListing);
  }

  Future<bool> openManageSubscriptions() async {
    notifyListeners();
    return _launchPlayUri(PlayStoreBilling.manageAppSubscriptions);
  }

  /// Volta a ler Firestore/prefs. Após comprar na Play, actualize o perfil no backend ou abra sessão de novo.
  Future<void> restorePurchases() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await refreshStatus();

    _isLoading = false;
    notifyListeners();
  }

  void setRegion(String regionCode) {
    _currentRegion = regionCode;
    notifyListeners();
  }

  String getFormattedPrice(String offerType) {
    if (offerType == 'monthly') {
      return SubscriptionConstants.getMonthlyPrice(_currentRegion);
    } else {
      return SubscriptionConstants.getYearlyPrice(_currentRegion);
    }
  }

  List<String> getLocalizedBenefits() {
    return SubscriptionConstants.getBenefitsForLocale(_currentRegion);
  }

  Future<void> updatePremiumStatus(bool isPremium) async {
    _isPremium = isPremium;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_premium', isPremium);

    await _mirrorPremiumToFirestore();
  }

  Future<void> _mirrorPremiumToFirestore() async {
    if (!_firebaseReady) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    try {
      await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set(
        {
          'isPremium': _isPremium,
          if (_subscriptionEndDate != null)
            'premiumEndDate': Timestamp.fromDate(_subscriptionEndDate!),
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      debugPrint('mirrorPremiumToFirestore: $e');
    }
  }

  Future<void> simulatePremium() async {
    _simulatePremiumActive = true;
    _isPremium = true;
    _subscriptionEndDate = DateTime.now().add(const Duration(days: 365));
    _errorMessage = null;
    notifyListeners();

    await AppThemeController.instance.setPremiumStatus(true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_premium', true);
    await _mirrorPremiumToFirestore();
    notifyListeners();
  }

  Future<void> debugSimulatePremiumPurchase() async {
    if (!kDebugMode) return;
    await simulatePremium();
  }
}
