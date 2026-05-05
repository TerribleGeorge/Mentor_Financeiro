import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../domain/investment/investment_catalog.dart'
    show InvestmentCatalog, InvestmentProductDefinition;
import 'revenue_cat_bootstrap.dart';
import 'regional_context_controller.dart';

/// Filtra tipos de investimento conforme **país da conta da loja** (RevenueCat / StoreKit ou Play)
/// com fallback para [RegionalContextController] (locale / IP).
///
/// Prioridade: `Purchases.storefront.countryCode` quando o SDK está activo; caso contrário,
/// país inferido regionalmente.
class InvestmentCategoryProvider extends ChangeNotifier {
  InvestmentCategoryProvider(this._regional) {
    _regional.addListener(_onRegionalChanged);
  }

  final RegionalContextController _regional;

  /// País da conta Google Play / App Store (ISO 2), quando disponível.
  String? _storefrontCountryCode;

  void _onRegionalChanged() => notifyListeners();

  /// ISO 3166-1 alpha-2 efectivo para o catálogo (storefront tem prioridade sobre IP/locale).
  String get effectiveCountryCode =>
      (_storefrontCountryCode ?? _regional.countryCode).toUpperCase();

  bool get isBrazilMarket => effectiveCountryCode == 'BR';

  List<InvestmentProductDefinition> get registrationCategories =>
      InvestmentCatalog.forRegistration(isBrazilMarket);

  List<InvestmentProductDefinition> get educationCategories =>
      InvestmentCatalog.forEducation(isBrazilMarket);

  /// Chamar após [Purchases.configure] ou mudança de utilizador na loja.
  Future<void> syncStorefrontFromRevenueCat() async {
    if (!RevenueCatBootstrap.isSdkReady) {
      _storefrontCountryCode = null;
      notifyListeners();
      return;
    }
    try {
      final sf = await Purchases.storefront;
      _storefrontCountryCode = sf?.countryCode.toUpperCase();
    } catch (e, st) {
      debugPrint('InvestmentCategoryProvider storefront: $e\n$st');
      _storefrontCountryCode = null;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _regional.removeListener(_onRegionalChanged);
    super.dispose();
  }
}
