import 'package:flutter/foundation.dart';

import '../data/providers/yahoo_financial_data_provider.dart';
import '../domain/entities/financial_quote.dart';
import 'ticker_market_resolver.dart';

/// Resultado de uma pesquisa de cotação (Yahoo Finance via HTTP, mesmo canal que o painel global).
class EquityQuoteLookupResult {
  EquityQuoteLookupResult({
    required this.inputTicker,
    required this.yahooSymbol,
    required this.market,
    required this.quote,
  });

  final String inputTicker;
  final String yahooSymbol;
  final ListedMarket market;
  final FinancialQuote? quote;
}

/// Busca cotação para qualquer ticker que o utilizador digitar (B3 ou EUA).
abstract final class GlobalEquityQuoteService {
  static final YahooFinancialDataProvider _yahoo = YahooFinancialDataProvider();

  /// Obtém último preço conhecido via Yahoo (NASDAQ/NYSE ou `.SA` para B3).
  static Future<EquityQuoteLookupResult> lookup(String rawTicker) async {
    final trimmed = rawTicker.trim();
    if (trimmed.isEmpty) {
      return EquityQuoteLookupResult(
        inputTicker: trimmed,
        yahooSymbol: '',
        market: ListedMarket.unknown,
        quote: null,
      );
    }

    final market = TickerMarketResolver.classifyMarket(trimmed);
    final yahooSym = TickerMarketResolver.yahooFinanceSymbol(trimmed);

    try {
      final snap = await _yahoo.fetchQuotes([yahooSym]);
      FinancialQuote? q;
      if (snap.quotes.isNotEmpty) {
        q = snap.quotes.first;
      }

      // Fallback: mercado desconhecido — tenta literal e depois .SA se país BR no texto não ajudar.
      if (q == null && market == ListedMarket.unknown) {
        final snap2 = await _yahoo.fetchQuotes([trimmed.toUpperCase()]);
        if (snap2.quotes.isNotEmpty) {
          q = snap2.quotes.first;
        }
      }

      return EquityQuoteLookupResult(
        inputTicker: trimmed,
        yahooSymbol: yahooSym,
        market: q != null ? market : ListedMarket.unknown,
        quote: q,
      );
    } catch (e, st) {
      debugPrint('GlobalEquityQuoteService.lookup: $e\n$st');
      return EquityQuoteLookupResult(
        inputTicker: trimmed,
        yahooSymbol: yahooSym,
        market: market,
        quote: null,
      );
    }
  }
}
