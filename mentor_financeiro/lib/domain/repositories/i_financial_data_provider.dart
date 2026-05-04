import '../entities/financial_market_region.dart';
import '../entities/market_data_snapshot.dart';

/// Contrato para extensões de mercado (BR, global, futuros países).
abstract class IFinancialDataProvider {
  String get providerId;

  FinancialMarketRegion get region;

  Future<MarketDataSnapshot> fetchQuotes(List<String> symbols);
}
