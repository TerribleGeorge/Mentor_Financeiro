import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalizationService {
  static Locale _currentLocale = const Locale('pt', 'BR');
  static String _currencySymbol = 'R\$';
  static String _currencyCode = 'BRL';

  static Locale get currentLocale => _currentLocale;
  static String get currencySymbol => _currencySymbol;
  static String get currencyCode => _currencyCode;

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
      _currencySymbol = 'R\$';
      _currencyCode = 'BRL';
    } else if (systemLocale.languageCode == 'en') {
      _currentLocale = const Locale('en', 'US');
      _currencySymbol = '\$';
      _currencyCode = 'USD';
    } else if (systemLocale.languageCode == 'es') {
      _currentLocale = const Locale('es', 'ES');
      _currencySymbol = '€';
      _currencyCode = 'EUR';
    } else {
      _currentLocale = const Locale('pt', 'BR');
      _currencySymbol = 'R\$';
      _currencyCode = 'BRL';
    }
  }

  static void setLocale(Locale locale) {
    _currentLocale = locale;
    if (locale.countryCode == 'BR' || locale.languageCode == 'pt') {
      _currencySymbol = 'R\$';
      _currencyCode = 'BRL';
    } else if (locale.languageCode == 'en') {
      _currencySymbol = '\$';
      _currencyCode = 'USD';
    } else if (locale.languageCode == 'es') {
      _currencySymbol = '€';
      _currencyCode = 'EUR';
    }
  }

  static List<Locale> get supportedLocales => const [
    Locale('pt', 'BR'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  static String getCurrencySymbolForLocale(Locale locale) {
    if (locale.countryCode == 'BR' || locale.languageCode == 'pt') {
      return 'R\$';
    } else if (locale.languageCode == 'en') {
      return '\$';
    } else if (locale.languageCode == 'es') {
      return '€';
    }
    return 'R\$';
  }

  static String getLocaleName(Locale locale) {
    if (locale.languageCode == 'pt') return 'Português (BR)';
    if (locale.languageCode == 'en') return 'English (US)';
    if (locale.languageCode == 'es') return 'Español (ES)';
    return 'Português (BR)';
  }
}
