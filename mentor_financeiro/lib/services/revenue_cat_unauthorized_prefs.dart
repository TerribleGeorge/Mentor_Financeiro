import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persiste falha de credenciais RevenueCat (ex.: HTTP 401 / API key inválida)
/// para que [SubscriptionProvider] não restaure premium a partir do Firestore por engano.
abstract final class RevenueCatUnauthorizedPrefs {
  static const String _key = 'revenuecat_unauthorized_force_free';

  static Future<void> mark() async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_key, true);
  }

  static Future<void> clear() async {
    final p = await SharedPreferences.getInstance();
    await p.remove(_key);
  }

  static Future<bool> isMarked() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool(_key) ?? false;
  }

  static bool exceptionIndicatesUnauthorized(Object e) {
    if (e is PlatformException) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      return code == PurchasesErrorCode.invalidCredentialsError;
    }
    final s = e.toString().toLowerCase();
    return s.contains('401') || s.contains('unauthorized');
  }
}
