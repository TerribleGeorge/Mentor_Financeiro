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
    final price = regionalPrices[regionCode] ?? 1.99;
    final symbol = currencySymbols[regionCode] ?? '\$';
    final yearlyPrice = price * 10; // Aproximadamente 10 meses
    return '$symbol ${yearlyPrice.toStringAsFixed(2)}/ano';
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
      return '7-day free trial included';
    }
    if (locale.startsWith('es')) {
      return 'Incluye 7 días de prueba gratuita';
    }
    return 'Inclui 7 dias de teste grátis';
  }

  /// Aviso breve sobre renovação e gestão na Play Store.
  static String freeTrialDisclaimerForLocale(String locale) {
    if (locale.startsWith('en')) {
      return 'After the trial, billing continues on Google Play unless you cancel '
          'at least 24 hours before renewal. You can manage or cancel anytime in Play '
          'Store → Payments & subscriptions → Subscriptions.';
    }
    if (locale.startsWith('es')) {
      return 'Tras la prueba, el cobro continúa en Google Play salvo que canceles '
          'con al menos 24 h de antelación. Puedes gestionar o cancelar en Play Store '
          '→ Pagos y suscripciones → Suscripciones.';
    }
    return 'Após o teste, a cobrança continua na Google Play salvo se canceles com '
        'pelo menos 24 horas de antecedência. Podes gerir ou cancelar na Play Store '
        '→ Pagamentos e subscrições → Subscrições.';
  }

  /// Rótulo do botão de subscrição com teste.
  static String freeTrialCtaForLocale(String locale) {
    if (locale.startsWith('en')) return 'Start free trial';
    if (locale.startsWith('es')) return 'Empezar prueba gratis';
    return 'Começar teste grátis';
  }
}
