import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../core/config/app_secrets.dart';
import 'app_theme_controller.dart' show AppThemeController;
import 'revenue_cat_subscription_service.dart';

/// Inicialização segura do RevenueCat: só configura com chave válida do `.env`;
/// expõe [isSdkReady] para evitar chamadas ao SDK antes de [Purchases.configure].
abstract final class RevenueCatBootstrap {
  static bool _sdkReady = false;

  static bool get isSdkReady => _sdkReady;

  /// Reseta o estado (ex.: timeout no boot ou falha).
  static void abort() {
    _sdkReady = false;
  }

  static String? _apiKeyForPlatform() {
    if (kIsWeb) return null;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? AppSecrets.revenueCatIos
        : AppSecrets.revenueCatAndroid;
  }

  /// `true` se existir chave não vazia para a plataforma atual.
  static bool hasConfiguredApiKey() {
    final k = _apiKeyForPlatform();
    return k != null && k.isNotEmpty;
  }

  /// [Purchases.configure] + login opcional + sincronização de premium.
  /// Não usar timeout aqui: o chamador envolve em `timeout` no [main].
  static Future<void> run(String? uid) async {
    if (kIsWeb) {
      _sdkReady = false;
      return;
    }

    final apiKey = _apiKeyForPlatform();
    if (apiKey == null || apiKey.isEmpty) {
      _sdkReady = false;
      log(
        'RevenueCat: REVENUECAT_ANDROID_API_KEY / REVENUECAT_IOS_API_KEY ausentes ou vazias no .env — modo grátis.',
        name: 'mentor.bootstrap',
      );
      await AppThemeController.instance.setPremiumStatus(false);
      return;
    }

    final trimmed = apiKey.trim();
    final looksLikePublicKey =
        trimmed.startsWith('goog_') || trimmed.startsWith('appl_');
    if (!looksLikePublicKey) {
      log(
        'RevenueCat: chave parece inválida (esperado goog_... / appl_...). Confira se é a Public SDK Key do projeto.',
        name: 'mentor.bootstrap',
      );
    }

    try {
      await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.warn);
      await Purchases.configure(PurchasesConfiguration(trimmed));
      _sdkReady = true;

      if (uid != null && uid.isNotEmpty) {
        try {
          await Purchases.logIn(uid);
        } catch (e, st) {
          log(
            'RevenueCat logIn (continua anónimo): $e',
            name: 'mentor.bootstrap',
            error: e,
            stackTrace: st,
          );
        }
      }

      await refreshPremiumFromRevenueCat();
    } on PlatformException catch (_) {
      _sdkReady = false;
      // Emergência UX: não travar o boot nem poluir console se a chave estiver inválida (401).
      await AppThemeController.instance.setPremiumStatus(false);
    } catch (e, st) {
      _sdkReady = false;
      log(
        'RevenueCat: configure/sync falhou — modo grátis. $e',
        name: 'mentor.bootstrap',
        error: e,
        stackTrace: st,
      );
      await AppThemeController.instance.setPremiumStatus(false);
    }
  }

  /// Só chama [Purchases.getCustomerInfo] se o SDK foi configurado nesta sessão.
  static Future<void> refreshPremiumFromRevenueCat() async {
    if (!_sdkReady) {
      await AppThemeController.instance.setPremiumStatus(false);
      return;
    }
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final isPremium =
          RevenueCatSubscriptionService.customerHasPremiumAccess(customerInfo);
      await AppThemeController.instance.setPremiumStatus(isPremium);
    } catch (e, st) {
      log(
        'RevenueCat getCustomerInfo: $e',
        name: 'mentor.bootstrap',
        error: e,
        stackTrace: st,
      );
      await AppThemeController.instance.setPremiumStatus(false);
    }
  }

  static Future<void> logOutIfConfigured() async {
    if (!_sdkReady) return;
    try {
      await Purchases.logOut();
    } catch (e, st) {
      log('RevenueCat logOut: $e', name: 'mentor.bootstrap', error: e, stackTrace: st);
    }
  }

  /// Alinha o utilizador RevenueCat com o Firebase (`Purchases.logIn` / `logOut`).
  /// Não atualiza UI — o chamador deve seguir com [SubscriptionProvider.refreshFromRevenueCat]
  /// ou o listener de [CustomerInfo].
  static Future<void> syncFirebaseUser(String? uid) async {
    if (!_sdkReady || kIsWeb) return;
    try {
      if (uid != null && uid.isNotEmpty) {
        final current = await Purchases.appUserID;
        if (current != uid) {
          await Purchases.logIn(uid);
        }
      } else {
        await logOutIfConfigured();
      }
    } catch (e, st) {
      log(
        'RevenueCat syncFirebaseUser: $e',
        name: 'mentor.bootstrap',
        error: e,
        stackTrace: st,
      );
    }
  }
}
