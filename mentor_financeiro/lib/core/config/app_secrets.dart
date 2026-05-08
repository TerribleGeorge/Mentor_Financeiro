import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Chaves e identificadores sensíveis vêm apenas do `.env` (nunca versionar valores reais).
abstract final class AppSecrets {
  static String? _env(String key) {
    try {
      return dotenv.env[key]?.trim();
    } catch (_) {
      // [DotEnv] ainda não inicializado ou load falhou — não rebentar o arranque.
      return null;
    }
  }

  /// Opcional: Alpha Vantage para cotações globais ([AlphaVantageFinancialDataProvider]).
  static String? get alphaVantageApiKey => _env('ALPHA_VANTAGE_API_KEY');

  /// Um ou mais e-mails admin separados por vírgula (ex.: `a@x.com,b@y.com`).
  static Set<String> get adminEmails {
    final raw = _env('FIREBASE_ADMIN_EMAIL') ?? '';
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
