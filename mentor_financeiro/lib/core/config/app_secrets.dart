import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Chaves e identificadores sensíveis vêm apenas do `.env` (nunca versionar valores reais).
abstract final class AppSecrets {
  static String? get revenueCatAndroid =>
      dotenv.env['REVENUECAT_ANDROID_API_KEY']?.trim();

  static String? get revenueCatIos =>
      dotenv.env['REVENUECAT_IOS_API_KEY']?.trim();

  /// Opcional: Alpha Vantage para cotações globais ([AlphaVantageFinancialDataProvider]).
  static String? get alphaVantageApiKey =>
      dotenv.env['ALPHA_VANTAGE_API_KEY']?.trim();

  /// Um ou mais e-mails admin separados por vírgula (ex.: `a@x.com,b@y.com`).
  static Set<String> get adminEmails {
    final raw = dotenv.env['FIREBASE_ADMIN_EMAIL']?.trim() ?? '';
    if (raw.isEmpty) return {};
    return raw
        .split(',')
        .map((e) => e.trim().toLowerCase())
        .where((e) => e.isNotEmpty)
        .toSet();
  }

  static bool isAdminEmail(String? email) {
    if (email == null || email.isEmpty) return false;
    return adminEmails.contains(email.toLowerCase());
  }
}
