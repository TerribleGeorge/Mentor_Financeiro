import 'package:flutter/foundation.dart';

import 'localization_service.dart';

/// Notifica o app quando a moeda de exibição muda (manual ou automática por idioma).
class CurrencyPreferenceController extends ChangeNotifier {
  CurrencyPreferenceController._();
  static final CurrencyPreferenceController instance =
      CurrencyPreferenceController._();
  factory CurrencyPreferenceController() => instance;

  Future<void> initialize() async {
    await LocalizationService.initializeCurrencyMode();
    notifyListeners();
  }

  Future<void> setCurrencyMode(String mode) async {
    await LocalizationService.setCurrencyMode(mode);
    notifyListeners();
  }

  String get mode => LocalizationService.currencyMode;
}
