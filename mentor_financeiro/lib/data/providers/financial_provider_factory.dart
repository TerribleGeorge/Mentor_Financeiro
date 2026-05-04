import '../../domain/entities/financial_market_region.dart';
import '../../domain/repositories/i_financial_data_provider.dart';
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
        return YahooFinancialDataProvider();
    }
  }
}
