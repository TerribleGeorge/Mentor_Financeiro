/// Cotação normalizada vinda de qualquer provedor financeiro.
class FinancialQuote {
  final String symbol;
  final String? shortName;
  final double price;
  final String currency;
  final double? changePercent;

  const FinancialQuote({
    required this.symbol,
    required this.shortName,
    required this.price,
    required this.currency,
    required this.changePercent,
  });
}
