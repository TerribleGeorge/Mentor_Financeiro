import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/subscription_constants.dart';
import '../core/constants/play_store_billing.dart';
import 'app_theme_controller.dart';
import 'google_play_billing_service.dart';

class SubscriptionProvider extends ChangeNotifier {
  static const String _ownerEmail = 'george.guimares@gmail.com';

  bool get isOwner {
    final email = FirebaseAuth.instance.currentUser?.email
        ?.trim()
        .toLowerCase();
    return email != null && email == _ownerEmail.toLowerCase();
  }

  bool _isPremium = false;
  bool _simulatePremiumActive = false;
  bool _isLoading = false;
  String? _errorMessage;
  String _currentRegion = 'BR';
  DateTime? _subscriptionEndDate;
  String? _pendingPurchasePlan;
  bool _billingListenerAttached = false;
  bool _activatingBillingPurchase = false;
  Future<void>? _billingInitFuture;

  final GooglePlayBillingService _billing = GooglePlayBillingService.instance;

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
    unawaited(_ensureBillingInitialized());
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
    await _ensureBillingInitialized();
    await _loadPremiumStatusFallback();
    if (_billing.hasActivePurchase) {
      await _activatePremiumFromBilling();
    }
    await _enforcePremiumThemeGate();
    notifyListeners();
  }

  Future<void> _ensureBillingInitialized() async {
    if (kIsWeb) return;
    if (!_billingListenerAttached) {
      _billing.addListener(_onBillingChanged);
      _billingListenerAttached = true;
    }

    _billingInitFuture ??= _billing.initialize(
      productId: PlayStoreBilling.premiumProductId,
    );
    await _billingInitFuture;
    if (_billing.error != null && _billing.error!.trim().isNotEmpty) {
      _errorMessage = _billing.error;
    }
  }

  void _onBillingChanged() {
    _isLoading = _billing.isLoading;
    if (_billing.error != null && _billing.error!.trim().isNotEmpty) {
      _errorMessage = _billing.error;
    }
    if (_billing.hasActivePurchase) {
      unawaited(_activatePremiumFromBilling());
    }
    notifyListeners();
  }

  Future<void> _activatePremiumFromBilling() async {
    if (_activatingBillingPurchase || _simulatePremiumActive) return;
    _activatingBillingPurchase = true;
    try {
      final now = DateTime.now();
      _subscriptionEndDate = _pendingPurchasePlan == 'anual'
          ? now.add(const Duration(days: 366))
          : now.add(const Duration(days: 31));
      await updatePremiumStatus(true);
      _errorMessage = null;
    } finally {
      _activatingBillingPurchase = false;
    }
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
                _subscriptionEndDate = (data!['premiumEndDate'] as Timestamp)
                    .toDate();
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

  /// Inicia a assinatura usando o Google Play Billing dentro do app.
  Future<bool> purchaseMonthly() async => _purchaseSubscription(
    plan: 'mensal',
    basePlanId: PlayStoreBilling.monthlyBasePlanId,
    preferFreeTrial: true,
  );

  Future<bool> purchaseYearly() async => _purchaseSubscription(
    plan: 'anual',
    basePlanId: PlayStoreBilling.yearlyBasePlanId,
  );

  Future<bool> purchaseLifetime() async => purchaseMonthly();

  Future<bool> _purchaseSubscription({
    required String plan,
    required String basePlanId,
    bool preferFreeTrial = false,
  }) async {
    _pendingPurchasePlan = plan;
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    await _ensureBillingInitialized();
    if (_billing.error != null && _billing.error!.trim().isNotEmpty) {
      _errorMessage = _billing.error;
      _isLoading = false;
      notifyListeners();
      return false;
    }

    await _billing.buySubscription(
      basePlanId: basePlanId,
      preferFreeTrial: preferFreeTrial,
    );
    final hasError =
        _billing.error != null && _billing.error!.trim().isNotEmpty;
    _errorMessage = hasError ? _billing.error : null;
    _isLoading = _billing.isLoading;
    notifyListeners();
    return !hasError;
  }

  Future<bool> openPlayStoreListing() async {
    notifyListeners();
    return _launchPlayUri(PlayStoreBilling.appListing);
  }

  Future<bool> openManageSubscriptions() async {
    notifyListeners();
    return _launchPlayUri(PlayStoreBilling.manageAppSubscriptions);
  }

  /// Restaura compras pelo Google Play Billing e atualiza o estado local/Firestore.
  Future<void> restorePurchases() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await _ensureBillingInitialized();
    await _billing.restore();
    if (_billing.hasActivePurchase) {
      await _activatePremiumFromBilling();
    }
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
      final billingPrice = _billing.formattedPriceForBasePlan(
        PlayStoreBilling.monthlyBasePlanId,
      );
      if (billingPrice != null && billingPrice.trim().isNotEmpty) {
        return '$billingPrice/mês';
      }
      return SubscriptionConstants.getMonthlyPrice(_currentRegion);
    }

    return SubscriptionConstants.getYearlyPrice(_currentRegion);
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
      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .set({
            'isPremium': _isPremium,
            if (_subscriptionEndDate != null)
              'premiumEndDate': Timestamp.fromDate(_subscriptionEndDate!),
          }, SetOptions(merge: true));
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

  @override
  void dispose() {
    if (_billingListenerAttached) {
      _billing.removeListener(_onBillingChanged);
      _billingListenerAttached = false;
    }
    super.dispose();
  }
}
