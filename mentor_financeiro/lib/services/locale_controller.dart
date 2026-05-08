import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization_service.dart';

/// Mantém o [Locale] do [MaterialApp] alinhado à chave [idioma] no SharedPreferences.
class LocaleController extends ChangeNotifier {
  LocaleController._();
  static final LocaleController instance = LocaleController._();
  factory LocaleController() => instance;

  static const String prefsKey = 'idioma';

  /// Idiomas que têm ARB no projeto; outros idiomas fazem fallback em runtime.
  static const Set<String> supportedLanguageCodes = {'pt', 'en', 'es'};

  /// Idiomas que podem ser escolhidos manualmente no app.
  ///
  /// Os idiomas sem ARB próprio usam os textos em inglês como fallback.
  static const List<({String code, String label})> languageOptions = [
    (code: 'pt', label: 'Português'),
    (code: 'en', label: 'English'),
    (code: 'es', label: 'Español'),
    (code: 'af', label: 'Afrikaans'),
    (code: 'am', label: 'አማርኛ'),
    (code: 'ar', label: 'العربية'),
    (code: 'as', label: 'অসমীয়া'),
    (code: 'az', label: 'Azərbaycan'),
    (code: 'be', label: 'Беларуская'),
    (code: 'bg', label: 'Български'),
    (code: 'bn', label: 'বাংলা'),
    (code: 'bs', label: 'Bosanski'),
    (code: 'ca', label: 'Català'),
    (code: 'cs', label: 'Čeština'),
    (code: 'da', label: 'Dansk'),
    (code: 'de', label: 'Deutsch'),
    (code: 'el', label: 'Ελληνικά'),
    (code: 'et', label: 'Eesti'),
    (code: 'eu', label: 'Euskara'),
    (code: 'fa', label: 'فارسی'),
    (code: 'fi', label: 'Suomi'),
    (code: 'fil', label: 'Filipino'),
    (code: 'fr', label: 'Français'),
    (code: 'gl', label: 'Galego'),
    (code: 'gsw', label: 'Schweizerdeutsch'),
    (code: 'gu', label: 'ગુજરાતી'),
    (code: 'he', label: 'עברית'),
    (code: 'hi', label: 'हिन्दी'),
    (code: 'hr', label: 'Hrvatski'),
    (code: 'hu', label: 'Magyar'),
    (code: 'hy', label: 'Հայերեն'),
    (code: 'id', label: 'Indonesia'),
    (code: 'is', label: 'Íslenska'),
    (code: 'it', label: 'Italiano'),
    (code: 'ja', label: '日本語'),
    (code: 'ka', label: 'ქართული'),
    (code: 'kk', label: 'Қазақша'),
    (code: 'km', label: 'ខ្មែរ'),
    (code: 'kn', label: 'ಕನ್ನಡ'),
    (code: 'ko', label: '한국어'),
    (code: 'ky', label: 'Кыргызча'),
    (code: 'lo', label: 'ລາວ'),
    (code: 'lt', label: 'Lietuvių'),
    (code: 'lv', label: 'Latviešu'),
    (code: 'mk', label: 'Македонски'),
    (code: 'ml', label: 'മലയാളം'),
    (code: 'mn', label: 'Монгол'),
    (code: 'mr', label: 'मराठी'),
    (code: 'ms', label: 'Melayu'),
    (code: 'my', label: 'မြန်မာ'),
    (code: 'nb', label: 'Norsk bokmål'),
    (code: 'ne', label: 'नेपाली'),
    (code: 'nl', label: 'Nederlands'),
    (code: 'or', label: 'ଓଡ଼ିଆ'),
    (code: 'pa', label: 'ਪੰਜਾਬੀ'),
    (code: 'pl', label: 'Polski'),
    (code: 'ps', label: 'پښتو'),
    (code: 'ro', label: 'Română'),
    (code: 'ru', label: 'Русский'),
    (code: 'si', label: 'සිංහල'),
    (code: 'sk', label: 'Slovenčina'),
    (code: 'sl', label: 'Slovenščina'),
    (code: 'sq', label: 'Shqip'),
    (code: 'sr', label: 'Српски'),
    (code: 'sv', label: 'Svenska'),
    (code: 'sw', label: 'Kiswahili'),
    (code: 'ta', label: 'தமிழ்'),
    (code: 'te', label: 'తెలుగు'),
    (code: 'th', label: 'ไทย'),
    (code: 'tl', label: 'Tagalog'),
    (code: 'tr', label: 'Türkçe'),
    (code: 'uk', label: 'Українська'),
    (code: 'ur', label: 'اردو'),
    (code: 'uz', label: 'Oʻzbek'),
    (code: 'vi', label: 'Tiếng Việt'),
    (code: 'zh', label: '中文'),
    (code: 'zu', label: 'IsiZulu'),
  ];

  Locale _locale = const Locale('pt');

  Locale get locale => _locale;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(prefsKey) ?? 'pt';
    _applyLanguageCode(code);
    notifyListeners();
  }

  void _applyLanguageCode(String code) {
    final c = code.trim().isEmpty ? 'pt' : code.trim().toLowerCase();
    _locale = Locale(c);
    // Para Intl, só temos formatação garantida nos 3 idiomas.
    LocalizationService.setLocale(_fullLocaleForIntl(c));
  }

  /// Locale com país para formatação (datas, moeda) em [LocalizationService].
  static Locale fullLocaleForIntl(String languageCode) => _fullLocaleForIntl(
    supportedLanguageCodes.contains(languageCode) ? languageCode : 'en',
  );

  static Locale _fullLocaleForIntl(String code) {
    switch (code) {
      case 'en':
        return const Locale('en', 'US');
      case 'es':
        return const Locale('es', 'ES');
      case 'pt':
        return const Locale('pt', 'BR');
      default:
        return const Locale('en', 'US');
    }
  }

  Future<void> setLanguageCode(String code) async {
    _applyLanguageCode(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, code.trim().toLowerCase());
    notifyListeners();
  }

  static bool isTranslatedLanguageCode(String code) {
    return supportedLanguageCodes.contains(code.trim().toLowerCase());
  }

  static bool isSelectableLanguageCode(String code) {
    final normalized = code.trim().toLowerCase();
    return languageOptions.any((option) => option.code == normalized);
  }

  static String languageLabel(String code) {
    final normalized = code.trim().toLowerCase();
    for (final option in languageOptions) {
      if (option.code == normalized) return option.label;
    }
    return normalized.toUpperCase();
  }
}
