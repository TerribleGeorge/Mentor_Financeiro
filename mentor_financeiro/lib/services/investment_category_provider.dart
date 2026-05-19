import 'package:flutter/widgets.dart';

import '../domain/investment/investment_catalog.dart'
    show InvestmentCatalog, InvestmentProductDefinition;
import 'locale_controller.dart';
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
      _localized(InvestmentCatalog.forRegistration(isBrazilMarket));

  List<InvestmentProductDefinition> get educationCategories =>
      _localized(InvestmentCatalog.forEducation(isBrazilMarket));

  List<InvestmentProductDefinition> _localized(
    List<InvestmentProductDefinition> items,
  ) {
    final lang = LocaleController.instance.locale.languageCode.toLowerCase();
    if (lang.startsWith('pt')) return items;
    return items
        .map((item) {
          final text =
              _investmentText[item.id]?[lang.startsWith('es') ? 'es' : 'en'];
          if (text == null) return item;
          return InvestmentProductDefinition(
            id: item.id,
            title: text.title,
            description: text.description,
            icon: item.icon,
            audience: item.audience,
          );
        })
        .toList(growable: false);
  }

  /// Actualiza país da loja a partir do locale do dispositivo (substitui storefront RevenueCat).
  Future<void> syncStorefrontFromDeviceLocale() async {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final cc = locale.countryCode;
    _deviceCountryCode = cc != null && cc.isNotEmpty ? cc.toUpperCase() : null;
    notifyListeners();
  }

  @override
  void dispose() {
    _regional.removeListener(_onRegionalChanged);
    super.dispose();
  }
}

typedef _InvestmentCopy = ({String title, String description});

const _investmentText = <String, Map<String, _InvestmentCopy>>{
  'poupanca': {
    'en': (
      title: 'Savings account',
      description:
          'Traditional savings account. Immediate liquidity; returns are often below inflation in many countries.',
    ),
    'es': (
      title: 'Cuenta de ahorro',
      description:
          'Cuenta de ahorro tradicional. Liquidez inmediata; el rendimiento suele quedar por debajo de la inflación en muchos países.',
    ),
  },
  'tesouro_direto': {
    'en': (
      title: 'Treasury bonds',
      description:
          'Federal government bonds in Brazil. Considered low sovereign credit risk in Brazil.',
    ),
    'es': (
      title: 'Tesoro Directo',
      description:
          'Títulos públicos federales de Brasil. Considerados de bajo riesgo de crédito soberano en Brasil.',
    ),
  },
  'cdb': {
    'en': (
      title: 'Bank deposit certificate',
      description:
          'Brazilian bank deposit certificate. Fixed income with FGC protection up to legal limits.',
    ),
    'es': (
      title: 'Certificado de depósito bancario',
      description:
          'Certificado de depósito bancario de Brasil. Renta fija con protección del FGC hasta los límites legales.',
    ),
  },
  'lci_lca': {
    'en': (
      title: 'Real estate and agribusiness credit notes',
      description:
          'Brazilian real estate and agribusiness credit notes. Tax-exempt for individuals under specific conditions.',
    ),
    'es': (
      title: 'Letras de crédito inmobiliario y agro',
      description:
          'Letras de crédito inmobiliario y del agronegocio de Brasil. Exentas de IR para personas físicas bajo condiciones específicas.',
    ),
  },
  'fundos': {
    'en': (
      title: 'Investment funds',
      description:
          'Managed baskets of assets. Risk profile varies from conservative to aggressive.',
    ),
    'es': (
      title: 'Fondos de inversión',
      description:
          'Cestas gestionadas por administradores. Perfil de riesgo variable, de conservador a agresivo.',
    ),
  },
  'acoes': {
    'en': (
      title: 'Stocks',
      description:
          'Ownership in listed companies. Higher return and volatility; requires risk tolerance.',
    ),
    'es': (
      title: 'Acciones',
      description:
          'Participación en empresas cotizadas. Mayor retorno y volatilidad; exige tolerancia al riesgo.',
    ),
  },
  'etf': {
    'en': (
      title: 'ETFs',
      description:
          'Exchange-traded funds that track indexes such as S&P 500 or MSCI. Diversification with daily liquidity.',
    ),
    'es': (
      title: 'ETFs',
      description:
          'Fondos cotizados que replican índices como S&P 500 o MSCI. Diversificación con liquidez diaria.',
    ),
  },
  'stocks_global': {
    'en': (
      title: 'International stocks',
      description:
          'Stock markets outside Brazil, such as NYSE or NASDAQ. Currency and taxes depend on the account country.',
    ),
    'es': (
      title: 'Acciones internacionales',
      description:
          'Bolsa fuera de Brasil, como NYSE o NASDAQ. La moneda y los impuestos dependen del país de la cuenta.',
    ),
  },
  'cripto': {
    'en': (
      title: 'Cryptoassets',
      description:
          'Volatile digital assets. No guarantee fund; suitable only for bold risk profiles.',
    ),
    'es': (
      title: 'Criptoactivos',
      description:
          'Activos digitales volátiles. Sin fondo garantizador; adecuados solo para perfiles arriesgados.',
    ),
  },
  'debentures': {
    'en': (
      title: 'Corporate bonds',
      description:
          'Corporate debt securities. Issuer credit risk; fixed or variable coupons.',
    ),
    'es': (
      title: 'Debentures',
      description:
          'Títulos de deuda corporativa. Riesgo de crédito del emisor; cupones fijos o variables.',
    ),
  },
};
