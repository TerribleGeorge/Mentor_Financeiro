import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/subscription_constants.dart';
import 'app_theme_controller.dart' show AppThemeController, AppThemeMode;
import 'revenue_cat_bootstrap.dart';
import 'revenue_cat_subscription_service.dart';

class SubscriptionProvider extends ChangeNotifier {
  bool _isPremium = false;
  /// `true` só após [CustomerInfo] aplicado (entitlement vindo do RevenueCat), nunca por fallback Firestore sozinho.
  bool _premiumEntitlementFromRevenueCat = false;
  bool _isLoading = false;
  String? _errorMessage;
  String _currentRegion = 'BR';
  DateTime? _subscriptionEndDate;

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

  /// Tema Cyber: exige SDK pronto e entitlement `premium` confirmado em [CustomerInfo] (não Firestore/prefs em fallback).
  bool get hasPremiumEntitlementFromRevenueCat {
    if (!RevenueCatBootstrap.isSdkReady) return false;
    if (!_premiumEntitlementFromRevenueCat) return false;
    return hasActiveSubscription;
  }

  bool get _firebaseReady => Firebase.apps.isNotEmpty;

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    if (RevenueCatBootstrap.isSdkReady) {
      await refreshFromRevenueCat();
    } else {
      await _loadPremiumStatusFallback();
      await _enforceCyberThemeGate();
      notifyListeners();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _enforceCyberThemeGate() async {
    if (AppThemeController.instance.themeMode != AppThemeMode.cyber) return;
    if (hasPremiumEntitlementFromRevenueCat) return;
    await AppThemeController.instance.setThemeMode(AppThemeMode.voidTheme);
  }

  /// Limpa mensagem de erro da última compra (ex.: antes de abrir o modal de paywall).
  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Consulta [Purchases.getCustomerInfo], aplica entitlements (`premium`, …) e
  /// devolve se o utilizador tem assinatura premium activa.
  Future<bool> syncPremiumFromCustomerInfo() async {
    await refreshFromRevenueCat();
    return hasActiveSubscription;
  }

  /// Fonte de verdade quando o SDK RevenueCat está configurado.
  Future<void> refreshFromRevenueCat() async {
    if (!RevenueCatBootstrap.isSdkReady) {
      await _loadPremiumStatusFallback();
      await _enforceCyberThemeGate();
      notifyListeners();
      return;
    }
    try {
      final info = await Purchases.getCustomerInfo();
      await _applyCustomerInfo(info);
      _errorMessage = null;
    } catch (e, st) {
      debugPrint('refreshFromRevenueCat: $e\n$st');
      _errorMessage = e.toString();
      await _loadPremiumStatusFallback();
    }
    await _enforceCyberThemeGate();
    notifyListeners();
  }

  Future<void> _applyCustomerInfo(CustomerInfo info) async {
    _premiumEntitlementFromRevenueCat = true;
    _isPremium = RevenueCatSubscriptionService.customerHasPremiumAccess(info);
    final ent = RevenueCatSubscriptionService.activePremiumEntitlement(info);
    if (ent?.expirationDate != null) {
      _subscriptionEndDate = DateTime.tryParse(ent!.expirationDate!);
    } else {
      _subscriptionEndDate = null;
    }

    await AppThemeController.instance.setPremiumStatus(_isPremium);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_premium', _isPremium);

    await _mirrorPremiumToFirestore();
  }

  /// Atualização em tempo real ([Purchases.addCustomerInfoUpdateListener]) sem novo pedido HTTP.
  Future<void> applyCustomerInfo(CustomerInfo info) async {
    await _applyCustomerInfo(info);
    await _enforceCyberThemeGate();
    notifyListeners();
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

  /// Fallback: Firestore / prefs quando o SDK não está pronto.
  Future<void> _loadPremiumStatusFallback() async {
    _premiumEntitlementFromRevenueCat = false;
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
      await AppThemeController.instance
          .setPremiumStatus(hasPremiumEntitlementFromRevenueCat);
    }
  }

  Future<bool> _purchasePackage(Package? pkg) async {
    if (pkg == null) {
      _errorMessage = 'Pacote não disponível. Configure a offering no RevenueCat.';
      notifyListeners();
      return false;
    }
    if (!RevenueCatBootstrap.isSdkReady) {
      _errorMessage = 'Compras indisponíveis (RevenueCat não configurado).';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Purchases.purchase(PurchaseParams.package(pkg));
      await refreshFromRevenueCat();
      _isLoading = false;
      notifyListeners();
      return _isPremium;
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code != PurchasesErrorCode.purchaseCancelledError) {
        _errorMessage = e.message ?? e.toString();
      } else {
        _errorMessage = null;
      }
      _isLoading = false;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> purchaseMonthly() async {
    final offerings = await RevenueCatSubscriptionService.getOfferingsSafe();
    final offering =
        RevenueCatSubscriptionService.resolvePrimaryOffering(offerings);
    final pkg = RevenueCatSubscriptionService.resolveMonthly(offering);
    return _purchasePackage(pkg);
  }

  Future<bool> purchaseYearly() async {
    final offerings = await RevenueCatSubscriptionService.getOfferingsSafe();
    final offering =
        RevenueCatSubscriptionService.resolvePrimaryOffering(offerings);
    final pkg = RevenueCatSubscriptionService.resolveYearly(offering);
    return _purchasePackage(pkg);
  }

  Future<bool> purchaseLifetime() async {
    final offerings = await RevenueCatSubscriptionService.getOfferingsSafe();
    final offering =
        RevenueCatSubscriptionService.resolvePrimaryOffering(offerings);
    final pkg = RevenueCatSubscriptionService.resolveLifetime(offering);
    return _purchasePackage(pkg);
  }

  Future<void> restorePurchases() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    if (RevenueCatBootstrap.isSdkReady) {
      try {
        await Purchases.restorePurchases();
        await refreshFromRevenueCat();
      } on PlatformException catch (e) {
        _errorMessage = e.message ?? e.toString();
      } catch (e) {
        _errorMessage = e.toString();
      }
    } else {
      await _loadPremiumStatusFallback();
    }

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

  Future<void> refreshStatus() async {
    if (RevenueCatBootstrap.isSdkReady) {
      await refreshFromRevenueCat();
    } else {
      await _loadPremiumStatusFallback();
      notifyListeners();
    }
  }

  /// Só em **debug**: simula assinatura ativa para testar UI (tema Cyber, etc.) sem compra na loja.
  Future<void> debugSimulatePremiumPurchase() async {
    if (!kDebugMode) return;
    _premiumEntitlementFromRevenueCat = true;
    _isPremium = true;
    _subscriptionEndDate = DateTime.now().add(const Duration(days: 365));
    _errorMessage = null;
    await AppThemeController.instance.setPremiumStatus(true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_premium', true);
    await _mirrorPremiumToFirestore();
    notifyListeners();
  }
}
