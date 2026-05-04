import 'financial_quote.dart';

/// Snapshot pontual de mercado (sem persistência pesada no app).
class MarketDataSnapshot {
  final String providerId;
  final DateTime fetchedAt;
  final List<FinancialQuote> quotes;

  const MarketDataSnapshot({
    required this.providerId,
    required this.fetchedAt,
    required this.quotes,
  });
}
