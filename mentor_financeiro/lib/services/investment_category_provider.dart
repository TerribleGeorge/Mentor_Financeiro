import 'package:flutter/widgets.dart';

import '../domain/investment/investment_catalog.dart'
    show InvestmentCatalog, InvestmentProductDefinition;
import 'regional_context_controller.dart';

/// Filtra tipos de investimento conforme país (locale do dispositivo + fallback regional).
class InvestmentCategoryProvider extends ChangeNotifier {
  InvestmentCategoryProvider(this._regional) {
    _regional.addListener(_onRegionalChanged);
  }

  final RegionalContextController _regional;

  /// País inferido do locale do sistema (ISO 2), quando disponível.
  String? _deviceCountryCode;

  void _onRegionalChanged() => notifyListeners();

  /// ISO 3166-1 alpha-2 efectivo para o catálogo (locale do dispositivo tem prioridade sobre IP/regional).
  String get effectiveCountryCode =>
      (_deviceCountryCode ?? _regional.countryCode).toUpperCase();

  bool get isBrazilMarket => effectiveCountryCode == 'BR';

  List<InvestmentProductDefinition> get registrationCategories =>
      InvestmentCatalog.forRegistration(isBrazilMarket);

  List<InvestmentProductDefinition> get educationCategories =>
      InvestmentCatalog.forEducation(isBrazilMarket);

  /// Actualiza país da loja a partir do locale do dispositivo (substitui storefront RevenueCat).
  Future<void> syncStorefrontFromDeviceLocale() async {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final cc = locale.countryCode;
    _deviceCountryCode =
        cc != null && cc.isNotEmpty ? cc.toUpperCase() : null;
    notifyListeners();
  }

  @override
  void dispose() {
    _regional.removeListener(_onRegionalChanged);
    super.dispose();
  }
}
