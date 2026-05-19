import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

/// Delegate que aceita qualquer locale e faz fallback para inglês quando
/// o idioma não tem ARB no projeto.
class AppLocalizationsFallbackDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsFallbackDelegate();

  static const supportedLanguageCodes = <String>{
    'pt',
    'en',
    'es',
    'af',
    'am',
    'ar',
    'as',
    'az',
    'be',
    'bg',
    'bn',
    'bs',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'et',
    'eu',
    'fa',
    'fi',
    'fil',
    'fr',
    'gl',
    'gsw',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'hy',
    'id',
    'is',
    'it',
    'ja',
    'ka',
    'kk',
    'km',
    'kn',
    'ko',
    'ky',
    'lo',
    'lt',
    'lv',
    'mk',
    'ml',
    'mn',
    'mr',
    'ms',
    'my',
    'nb',
    'ne',
    'nl',
    'or',
    'pa',
    'pl',
    'ps',
    'ro',
    'ru',
    'si',
    'sk',
    'sl',
    'sq',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tl',
    'tr',
    'uk',
    'ur',
    'uz',
    'vi',
    'zh',
    'zu',
  };

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) {
    final lc = supportedLanguageCodes.contains(locale.languageCode)
        ? locale
        : const Locale('en');
    return AppLocalizations.delegate.load(lc);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
