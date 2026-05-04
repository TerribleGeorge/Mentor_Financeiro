import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  static Locale _currentLocale = const Locale('pt', 'BR');
  static String _currencySymbol = r'R$';
  static String _currencyCode = 'BRL';

  /// `AUTO` segue o idioma/região atual; caso contrário ISO (`BRL`, `USD`, `EUR`).
  static String _currencyMode = 'AUTO';

  static Locale get currentLocale => _currentLocale;
  static String get currencySymbol => _currencySymbol;
  static String get currencyCode => _currencyCode;
  static String get currencyMode => _currencyMode;

  static Future<void> initializeCurrencyMode() async {
    final prefs = await SharedPreferences.getInstance();
    _currencyMode = prefs.getString('moeda') ?? 'AUTO';
    _applyCurrencyDisplay();
  }

  static Future<void> setCurrencyMode(String mode) async {
    _currencyMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('moeda', mode);
    _applyCurrencyDisplay();
  }

  static String formatCurrency(double value) {
    final format = NumberFormat.currency(
      locale: _currentLocale.toString(),
      symbol: _currencySymbol,
      decimalDigits: 2,
    );
    return format.format(value);
  }

  static String formatDate(DateTime date) {
    final format = DateFormat.yMMMd(_currentLocale.toString());
    return format.format(date);
  }

  static String formatDateTime(DateTime date) {
    final format = DateFormat.yMMMd(_currentLocale.toString()).add_Hm();
    return format.format(date);
  }

  static void detectSystemLocale(BuildContext context) {
    final systemLocale = Localizations.localeOf(context);

    if (systemLocale.countryCode == 'BR' || systemLocale.languageCode == 'pt') {
      _currentLocale = const Locale('pt', 'BR');
    } else if (systemLocale.languageCode == 'en') {
      _currentLocale = const Locale('en', 'US');
    } else if (systemLocale.languageCode == 'es') {
      _currentLocale = const Locale('es', 'ES');
    } else {
      _currentLocale = const Locale('pt', 'BR');
    }
    _applyCurrencyDisplay();
  }

  static void setLocale(Locale locale) {
    _currentLocale = locale;
    _applyCurrencyDisplay();
  }

  static void _applyCurrencyDisplay() {
    if (_currencyMode != 'AUTO') {
      _applyIsoCurrency(_currencyMode);
      return;
    }
    _applyLocaleDefaultCurrency(_currentLocale);
  }

  static void _applyLocaleDefaultCurrency(Locale locale) {
    if (locale.countryCode == 'BR' || locale.languageCode == 'pt') {
      _currencySymbol = r'R$';
      _currencyCode = 'BRL';
    } else if (locale.languageCode == 'en') {
      _currencySymbol = r'$';
      _currencyCode = 'USD';
    } else if (locale.languageCode == 'es') {
      _currencySymbol = '€';
      _currencyCode = 'EUR';
    } else {
      _currencySymbol = r'R$';
      _currencyCode = 'BRL';
    }
  }

  static void _applyIsoCurrency(String iso) {
    switch (iso.toUpperCase()) {
      case 'BRL':
        _currencySymbol = r'R$';
        _currencyCode = 'BRL';
        break;
      case 'USD':
        _currencySymbol = r'$';
        _currencyCode = 'USD';
        break;
      case 'EUR':
        _currencySymbol = '€';
        _currencyCode = 'EUR';
        break;
      default:
        _applyLocaleDefaultCurrency(_currentLocale);
    }
  }

  static List<Locale> get supportedLocales => const [
    Locale('pt', 'BR'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  static String getCurrencySymbolForLocale(Locale locale) {
    if (locale.countryCode == 'BR' || locale.languageCode == 'pt') {
      return r'R$';
    } else if (locale.languageCode == 'en') {
      return r'$';
    } else if (locale.languageCode == 'es') {
      return '€';
    }
    return r'R$';
  }

  static String getLocaleName(Locale locale) {
    if (locale.languageCode == 'pt') return 'Português (BR)';
    if (locale.languageCode == 'en') return 'English (US)';
    if (locale.languageCode == 'es') return 'Español (ES)';
    return 'Português (BR)';
  }
}
