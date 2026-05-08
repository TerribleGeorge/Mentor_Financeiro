import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

/// Delegate que aceita qualquer locale e faz fallback para inglês quando
/// o idioma não tem ARB no projeto.
class AppLocalizationsFallbackDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsFallbackDelegate();

  static const supportedLanguageCodes = <String>{'pt', 'en', 'es'};

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

