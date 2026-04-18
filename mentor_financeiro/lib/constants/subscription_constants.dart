class SubscriptionConstants {
  // ==============================================================================
  // CONFIGURAÇÕES REVENUECAT - ANDROID
  // ==============================================================================
  // IMPORTANTE: Substitua pelas suas chaves reais do RevenueCat Dashboard

  // Chave pública do app (Android) - Encontrada em Project Settings > API Keys
  static const String revenueCatApiKey = 'your_revenuecat_api_key_here';

  // IDs dos produtos (entitlement IDs) - Criados no RevenueCat Dashboard
  static const String premiumMonthlyEntitlementId = 'premium_monthly';
  static const String premiumYearlyEntitlementId = 'premium_yearly';

  // IDs das ofertas (offerings) - Encontrados em Offerings
  static const String defaultOfferingId = 'premium_offering';

  // ==============================================================================
  // PREÇOS POR REGIÃO (Fallback se não carregar do RevenueCat)
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
    'Temas Escuro e Médio',
    'Fundo de imagem personalizado',
    'Gráfico de velas detalhado',
    'Relatórios ilimitados',
    'Análise de investimentos IA',
    'Sem anúncios',
  ];

  static const List<String> premiumBenefitsEn = [
    'Dark and Medium themes',
    'Custom background image',
    'Detailed candle chart',
    'Unlimited reports',
    'AI investment analysis',
    'No ads',
  ];

  static const List<String> premiumBenefitsEs = [
    'Temas Oscuro y Medio',
    'Imagen de fondo personalizada',
    'Gráfico de velas detallado',
    'Informes ilimitados',
    'Análisis de inversión IA',
    'Sin anuncios',
  ];

  static List<String> getBenefitsForLocale(String locale) {
    if (locale.startsWith('en')) return premiumBenefitsEn;
    if (locale.startsWith('es')) return premiumBenefitsEs;
    return premiumBenefits;
  }
}
