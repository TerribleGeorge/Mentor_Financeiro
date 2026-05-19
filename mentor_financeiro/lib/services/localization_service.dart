import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  static Locale _currentLocale = const Locale('pt', 'BR');
  static String _currencySymbol = r'R$';
  static String _currencyCode = 'BRL';

  /// `AUTO` segue o idioma/região atual; caso contrário usa o ISO escolhido.
  static String _currencyMode = 'AUTO';

  static const List<({String code, String label, String symbol})>
  currencyOptions = [
    (code: 'BRL', label: 'Real brasileiro', symbol: r'R$'),
    (code: 'USD', label: 'Dólar americano', symbol: r'$'),
    (code: 'EUR', label: 'Euro', symbol: '€'),
    (code: 'GBP', label: 'Libra esterlina', symbol: '£'),
    (code: 'CAD', label: 'Dólar canadense', symbol: r'C$'),
    (code: 'AUD', label: 'Dólar australiano', symbol: r'A$'),
    (code: 'NZD', label: 'Dólar neozelandês', symbol: r'NZ$'),
    (code: 'CHF', label: 'Franco suíço', symbol: 'CHF'),
    (code: 'JPY', label: 'Iene japonês', symbol: '¥'),
    (code: 'CNY', label: 'Yuan chinês', symbol: '¥'),
    (code: 'HKD', label: 'Dólar de Hong Kong', symbol: r'HK$'),
    (code: 'SGD', label: 'Dólar de Singapura', symbol: r'S$'),
    (code: 'INR', label: 'Rupia indiana', symbol: '₹'),
    (code: 'KRW', label: 'Won sul-coreano', symbol: '₩'),
    (code: 'MXN', label: 'Peso mexicano', symbol: r'MX$'),
    (code: 'ARS', label: 'Peso argentino', symbol: r'AR$'),
    (code: 'CLP', label: 'Peso chileno', symbol: r'CLP$'),
    (code: 'COP', label: 'Peso colombiano', symbol: r'COL$'),
    (code: 'PEN', label: 'Sol peruano', symbol: 'S/'),
    (code: 'UYU', label: 'Peso uruguaio', symbol: r'$U'),
    (code: 'PYG', label: 'Guarani paraguaio', symbol: '₲'),
    (code: 'BOB', label: 'Boliviano', symbol: 'Bs'),
    (code: 'VES', label: 'Bolívar venezuelano', symbol: 'Bs'),
    (code: 'SEK', label: 'Coroa sueca', symbol: 'kr'),
    (code: 'NOK', label: 'Coroa norueguesa', symbol: 'kr'),
    (code: 'DKK', label: 'Coroa dinamarquesa', symbol: 'kr'),
    (code: 'PLN', label: 'Zlóti polonês', symbol: 'zł'),
    (code: 'CZK', label: 'Coroa tcheca', symbol: 'Kč'),
    (code: 'HUF', label: 'Florim húngaro', symbol: 'Ft'),
    (code: 'RON', label: 'Leu romeno', symbol: 'lei'),
    (code: 'RUB', label: 'Rublo russo', symbol: '₽'),
    (code: 'TRY', label: 'Lira turca', symbol: '₺'),
    (code: 'ZAR', label: 'Rand sul-africano', symbol: 'R'),
    (code: 'AED', label: 'Dirham dos Emirados', symbol: 'د.إ'),
    (code: 'SAR', label: 'Riyal saudita', symbol: '﷼'),
    (code: 'ILS', label: 'Novo shekel israelense', symbol: '₪'),
    (code: 'EGP', label: 'Libra egípcia', symbol: 'E£'),
    (code: 'NGN', label: 'Naira nigeriana', symbol: '₦'),
    (code: 'KES', label: 'Xelim queniano', symbol: 'KSh'),
    (code: 'GHS', label: 'Cedi ganês', symbol: '₵'),
    (code: 'MAD', label: 'Dirham marroquino', symbol: 'DH'),
    (code: 'THB', label: 'Baht tailandês', symbol: '฿'),
    (code: 'IDR', label: 'Rupia indonésia', symbol: 'Rp'),
    (code: 'MYR', label: 'Ringgit malaio', symbol: 'RM'),
    (code: 'PHP', label: 'Peso filipino', symbol: '₱'),
    (code: 'VND', label: 'Dong vietnamita', symbol: '₫'),
    (code: 'TWD', label: 'Novo dólar taiwanês', symbol: r'NT$'),
  ];

  static Locale get currentLocale => _currentLocale;
  static String get currencySymbol => _currencySymbol;
  static String get currencyCode => _currencyCode;
  static String get currencyMode => _currencyMode;

  static Future<void> initializeCurrencyMode() async {
    final prefs = await SharedPreferences.getInstance();
    _currencyMode = (prefs.getString('moeda') ?? 'AUTO').trim().toUpperCase();
    _applyCurrencyDisplay();
  }

  static Future<void> setCurrencyMode(String mode) async {
    _currencyMode = mode.trim().toUpperCase();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('moeda', _currencyMode);
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
    final normalized = iso.toUpperCase();
    for (final option in currencyOptions) {
      if (option.code == normalized) {
        _currencySymbol = option.symbol;
        _currencyCode = option.code;
        return;
      }
    }
    _applyLocaleDefaultCurrency(_currentLocale);
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

  static bool isSelectableCurrencyCode(String code) {
    final normalized = code.trim().toUpperCase();
    if (normalized == 'AUTO') return true;
    return currencyOptions.any((option) => option.code == normalized);
  }

  static String currencyLabel(String mode) {
    final normalized = mode.trim().toUpperCase();
    if (normalized == 'AUTO') {
      if (_currentLocale.languageCode == 'es') return 'Automática (idioma)';
      if (_currentLocale.languageCode == 'pt') return 'Automática (idioma)';
      return 'Automatic (language)';
    }
    for (final option in currencyOptions) {
      if (option.code == normalized) {
        return '${currencyNameForCode(option.code)} (${option.code})';
      }
    }
    return normalized;
  }

  static String currencySymbolForCode(String code) {
    final normalized = code.trim().toUpperCase();
    for (final option in currencyOptions) {
      if (option.code == normalized) return option.symbol;
    }
    return normalized;
  }

  static String currencyNameForCode(String code) {
    final normalized = code.trim().toUpperCase();
    if (_currentLocale.languageCode != 'pt') return normalized;
    for (final option in currencyOptions) {
      if (option.code == normalized) return option.label;
    }
    return normalized;
  }

  static String currencyCodeForCountry(String? countryCode) {
    final cc = (countryCode ?? '').trim().toUpperCase();
    const map = <String, String>{
      'BR': 'BRL',
      'US': 'USD',
      'CA': 'CAD',
      'GB': 'GBP',
      'AU': 'AUD',
      'NZ': 'NZD',
      'CH': 'CHF',
      'JP': 'JPY',
      'CN': 'CNY',
      'HK': 'HKD',
      'SG': 'SGD',
      'IN': 'INR',
      'KR': 'KRW',
      'MX': 'MXN',
      'AR': 'ARS',
      'CL': 'CLP',
      'CO': 'COP',
      'PE': 'PEN',
      'UY': 'UYU',
      'SE': 'SEK',
      'NO': 'NOK',
      'DK': 'DKK',
      'PL': 'PLN',
      'CZ': 'CZK',
      'HU': 'HUF',
      'RO': 'RON',
      'TR': 'TRY',
      'ZA': 'ZAR',
      'AE': 'AED',
      'SA': 'SAR',
      'IL': 'ILS',
      'TH': 'THB',
      'ID': 'IDR',
      'MY': 'MYR',
      'PH': 'PHP',
    };
    const euroCountries = {
      'AT',
      'BE',
      'CY',
      'DE',
      'EE',
      'ES',
      'FI',
      'FR',
      'GR',
      'HR',
      'IE',
      'IT',
      'LT',
      'LU',
      'LV',
      'MT',
      'NL',
      'PT',
      'SI',
      'SK',
    };
    if (euroCountries.contains(cc)) return 'EUR';
    return map[cc] ?? currencyCode;
  }
}
