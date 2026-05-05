import '../../core/config/app_secrets.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/repositories/i_financial_data_provider.dart';
import 'alpha_vantage_financial_data_provider.dart';
import 'brazilian_financial_data_provider.dart';
import 'yahoo_financial_data_provider.dart';

/// Resolve o provedor adequado ao mercado (plug-in por região).
class FinancialProviderFactory {
  const FinancialProviderFactory._();

  static IFinancialDataProvider forRegion(FinancialMarketRegion region) {
    switch (region) {
      case FinancialMarketRegion.brazil:
        return BrazilianFinancialDataProvider();
      case FinancialMarketRegion.global:
        final av = AppSecrets.alphaVantageApiKey;
        if (av != null && av.isNotEmpty) {
          return AlphaVantageFinancialDataProvider(apiKey: av);
        }
        return YahooFinancialDataProvider();
    }
  }
}
