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
}
