class SubscriptionConstants {
  // Referências antigas (RC); não usadas pelo fluxo actual — mantidas por compatibilidade.
  static const String revenueCatApiKey = 'your_revenuecat_api_key_here';
  static const String premiumMonthlyEntitlementId = 'premium_monthly';
  static const String premiumYearlyEntitlementId = 'premium_yearly';
  static const String defaultOfferingId = 'premium_offering';

  // ==============================================================================
  // PREÇOS POR REGIÃO (fallback na UI; valores reais vêm da Google Play)
  // ==============================================================================
  static const Map<String, double> regionalPrices = {
    'BR': 9.90, // Brasil
    'US': 1.99, // Estados Unidos
    'ES': 1.99, // Espanha
    'MX': 1.99, // México
    'AR': 1.99, // Argentina
  };

  static const Map<String, double> yearlyRegionalPrices = {
    'BR': 99.90, // Brasil: 12 meses pelo preço aproximado de 10
    'US': 19.90,
    'ES': 19.90,
    'MX': 19.90,
    'AR': 19.90,
  };

  static const Map<String, String> currencySymbols = {
    'BR': 'R\$',
    'US': '\$',
    'ES': '€',
    'MX': '\$',
    'AR': '\$',
  };

  static String getPriceForRegion(String regionCode) {
    final price = regionalPrices[regionCode] ?? 1.99;
    final symbol = currencySymbols[regionCode] ?? '\$';
    return '$symbol ${price.toStringAsFixed(2)}';
  }

  static String getMonthlyPrice(String regionCode) {
    return getPriceForRegion(regionCode);
  }

  static String getYearlyPrice(String regionCode) {
    final price = yearlyRegionalPrices[regionCode] ?? 19.90;
    final symbol = currencySymbols[regionCode] ?? '\$';
    return '$symbol ${price.toStringAsFixed(2)}/ano';
  }

  // ==============================================================================
  // BENEFÍCIOS DO PREMIUM
  // ==============================================================================
  static const List<String> premiumBenefits = [
    'Relatórios mensais detalhados',
    'Gráficos avançados por categoria e pagamento',
    'Insights automáticos de organização financeira',
    'Monitoramento inteligente de notificações compatíveis',
    'Temas premium e personalização visual',
    'Sem anúncios',
  ];

  static const List<String> premiumBenefitsEn = [
    'Detailed monthly reports',
    'Advanced charts by category and payment method',
    'Automatic financial organization insights',
    'Smart monitoring for compatible spending notifications',
    'Premium themes and visual customization',
    'No ads',
  ];

  static const List<String> premiumBenefitsEs = [
    'Informes mensuales detallados',
    'Gráficos avanzados por categoría y método de pago',
    'Ideas automáticas para organizar tus finanzas',
    'Monitoreo inteligente de notificaciones compatibles de gastos',
    'Temas premium y personalización visual',
    'Sin anuncios',
  ];

  static List<String> getBenefitsForLocale(String locale) {
    if (locale.startsWith('en')) return premiumBenefitsEn;
    if (locale.startsWith('es')) return premiumBenefitsEs;
    return premiumBenefits;
  }

  /// Título do destaque do teste gratuito (Play Store / faturação Google).
  static String freeTrialHeadlineForLocale(String locale) {
    if (locale.startsWith('en')) {
      return '7-day free trial for new users';
    }
    if (locale.startsWith('es')) {
      return '7 días de prueba gratuita para nuevos usuarios';
    }
    return '7 dias de teste grátis para novos usuários';
  }

  /// Aviso breve sobre renovação e gestão na Play Store.
  static String freeTrialDisclaimerForLocale(String locale) {
    if (locale.startsWith('en')) {
      return 'The free trial can be used only once and is not renewable. After the '
          'trial, billing continues on Google Play unless you cancel at least 24 '
          'hours before renewal. You can manage or cancel anytime in Play Store.';
    }
    if (locale.startsWith('es')) {
      return 'La prueba gratuita se puede usar una sola vez y no es renovable. '
          'Después de la prueba, el cobro continúa en Google Play salvo que '
          'canceles con al menos 24 h de antelación. Puedes gestionar o cancelar '
          'en Play Store.';
    }
    return 'O teste gratuito pode ser usado uma única vez e não é renovável. '
        'Após o teste, a cobrança continua na Google Play salvo cancelamento '
        'com pelo menos 24 horas de antecedência. Você pode gerir ou cancelar '
        'na Play Store.';
  }

  /// Rótulo do botão de subscrição com teste.
  static String freeTrialCtaForLocale(String locale) {
    if (locale.startsWith('en')) return 'Start 7-day free trial';
    if (locale.startsWith('es')) return 'Empezar 7 días gratis';
    return 'Começar teste grátis de 7 dias';
  }
}
