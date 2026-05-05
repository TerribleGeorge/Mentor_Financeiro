/// Bolsa de listagem inferida a partir do texto do utilizador.
enum ListedMarket {
  b3,
  nasdaqNyse,
  unknown,
}

/// Resolve tickers **B3** (ex.: PETR4 → `PETR4.SA` no Yahoo) vs **EUA** (AAPL, MSFT).
///
/// Não usa pacote Python `yfinance`: o app obtém cotações via API HTTP Yahoo (como
/// [YahooFinancialDataProvider]).
abstract final class TickerMarketResolver {
  /// Padrão típico B3: 4 letras + dígito (ex.: PETR4, VALE3, MGLU3).
  static final _b3FourPlusDigit = RegExp(r'^[A-Z]{4}\d$');

  /// Alguns tickers B3 têm 3 letras + dígito.
  static final _b3ThreePlusDigit = RegExp(r'^[A-Z]{3}\d$');

  /// Tickers US comuns 1–5 letras (NYSE/NASDAQ).
  static final _usLettersOnly = RegExp(r'^[A-Z]{1,5}$');

  static ListedMarket classifyMarket(String raw) {
    final s = raw.trim().toUpperCase();
    if (s.isEmpty) return ListedMarket.unknown;

    if (s.endsWith('.SA') || s.contains('.SA')) {
      return ListedMarket.b3;
    }

    // Formato BRK.B (Classe B Berkshire) — mercado US.
    if (s.contains('.') && !s.endsWith('.SA')) {
      return ListedMarket.nasdaqNyse;
    }

    if (_b3FourPlusDigit.hasMatch(s) || _b3ThreePlusDigit.hasMatch(s)) {
      return ListedMarket.b3;
    }

    if (_usLettersOnly.hasMatch(s)) {
      return ListedMarket.nasdaqNyse;
    }

    return ListedMarket.unknown;
  }

  /// Símbolo para o endpoint chart Yahoo Finance v8.
  static String yahooFinanceSymbol(String raw) {
    final s = raw.trim().toUpperCase();
    if (s.isEmpty) return s;

    if (s.endsWith('.SA')) return s;

    switch (classifyMarket(raw)) {
      case ListedMarket.b3:
        final base = s.replaceAll(RegExp(r'\.SA$'), '');
        return '$base.SA';
      case ListedMarket.nasdaqNyse:
      case ListedMarket.unknown:
        return s;
    }
  }

  static String describeMarket(ListedMarket m) {
    switch (m) {
      case ListedMarket.b3:
        return 'B3 / Brasil';
      case ListedMarket.nasdaqNyse:
        return 'NASDAQ / NYSE';
      case ListedMarket.unknown:
        return 'Mercado não identificado';
    }
  }
}
