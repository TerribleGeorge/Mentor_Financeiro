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
  // TESTE GRÁTIS (Play Console — alinhar com a oferta configurada na loja)
  // ==============================================================================
  static const String playFreeTrialHeadlinePt = '7 dias grátis na Google Play';
  static const String playFreeTrialHeadlineEn =
      '7-day free trial on Google Play';
  static const String playFreeTrialHeadlineEs = '7 días gratis en Google Play';

  /// Texto curto para botões e destaques.
  static const String playFreeTrialCtaPt = 'Experimentar 7 dias grátis';
  static const String playFreeTrialCtaEn = 'Start 7-day free trial';
  static const String playFreeTrialCtaEs = 'Probar 7 días gratis';

  /// Aviso legal leve: o que manda é o ecrã da Play Store.
  static const String playFreeTrialDisclaimerPt =
      'A oferta de teste gratuito é gerida pela Google Play. A data em que a '
      'cobrança começa e as condições exactas aparecem no ecrã de compra antes '
      'de confirmares.';
  static const String playFreeTrialDisclaimerEn =
      'The free trial is handled by Google Play. Billing date and exact '
      'terms are shown on the purchase screen before you confirm.';
  static const String playFreeTrialDisclaimerEs =
      'La prueba gratuita la gestiona Google Play. La fecha de cobro y los '
      'términos exactos aparecen en la pantalla de compra antes de confirmar.';

  static String freeTrialHeadlineForLocale(String locale) {
    if (locale.startsWith('en')) return playFreeTrialHeadlineEn;
    if (locale.startsWith('es')) return playFreeTrialHeadlineEs;
    return playFreeTrialHeadlinePt;
  }

  static String freeTrialCtaForLocale(String locale) {
    if (locale.startsWith('en')) return playFreeTrialCtaEn;
    if (locale.startsWith('es')) return playFreeTrialCtaEs;
    return playFreeTrialCtaPt;
  }

  static String freeTrialDisclaimerForLocale(String locale) {
    if (locale.startsWith('en')) return playFreeTrialDisclaimerEn;
    if (locale.startsWith('es')) return playFreeTrialDisclaimerEs;
    return playFreeTrialDisclaimerPt;
  }

  // ==============================================================================
  // BENEFÍCIOS DO PREMIUM
  // ==============================================================================
  static const List<String> premiumBenefits = [
    '7 dias grátis para experimentar o Premium (detalhes e renovação no checkout da Google Play)',
    'Relatórios mensais detalhados',
    'Gráficos avançados por categoria e pagamento',
    'Insights automáticos de organização financeira',
    'Monitoramento inteligente de notificações compatíveis',
    'Temas premium e personalização visual',
    'Sem anúncios',
  ];

  static const List<String> premiumBenefitsEn = [
    '7-day free trial to try Premium (details and renewal in the Google Play checkout)',
    'Detailed monthly reports',
    'Advanced charts by category and payment method',
    'Automatic financial organization insights',
    'Smart monitoring for compatible spending notifications',
    'Premium themes and visual customization',
    'No ads',
  ];

  static const List<String> premiumBenefitsEs = [
    '7 días gratis para probar Premium (detalles y renovación en el checkout de Google Play)',
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
}
