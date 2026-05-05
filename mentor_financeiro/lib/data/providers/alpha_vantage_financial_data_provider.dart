import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/network/connectivity_service.dart';
import '../../core/network/offline_exception.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/financial_quote.dart';
import '../../domain/entities/market_data_snapshot.dart';
import '../../domain/repositories/i_financial_data_provider.dart';
import '../services/market_quotes_cache.dart';
import 'yahoo_financial_data_provider.dart';

/// Cotações via Alpha Vantage `GLOBAL_QUOTE` (requer chave no `.env`).
/// Em falha, limite de taxa ou resposta vazia, recorre ao [YahooFinancialDataProvider] por símbolo.
class AlphaVantageFinancialDataProvider implements IFinancialDataProvider {
  AlphaVantageFinancialDataProvider({
    required this.apiKey,
    http.Client? httpClient,
  })  : _http = httpClient ?? http.Client(),
        _yahoo = YahooFinancialDataProvider(httpClient: httpClient);

  final String apiKey;
  final http.Client _http;
  final YahooFinancialDataProvider _yahoo;

  @override
  String get providerId => 'alpha_vantage_global';

  @override
  FinancialMarketRegion get region => FinancialMarketRegion.global;

  @override
  Future<MarketDataSnapshot> fetchQuotes(List<String> symbols) async {
    final quotes = <FinancialQuote>[];
    final now = DateTime.now().toUtc();
    var online = false;

    for (final raw in symbols) {
      final symbol = raw.trim().toUpperCase();
      if (symbol.isEmpty) continue;

      if (!online) {
        await ConnectivityService.requireOnline();
        online = true;
      }

      final direct = await _tryAlpha(symbol);
      if (direct != null) {
        quotes.add(direct);
        continue;
      }

      try {
        final snap = await _yahoo.fetchQuotes([symbol]);
        quotes.addAll(snap.quotes);
      } catch (e, st) {
        debugPrint('AlphaVantage fallback Yahoo $symbol: $e\n$st');
      }
    }

    final snapshot = MarketDataSnapshot(
      providerId: providerId,
      fetchedAt: now,
      quotes: quotes,
    );
    MarketQuotesCache.instance.remember(providerId, snapshot);
    return snapshot;
  }

  Future<FinancialQuote?> _tryAlpha(String symbol) async {
    try {
      final uri = Uri.parse(
        'https://www.alphavantage.co/query?function=GLOBAL_QUOTE'
        '&symbol=${Uri.encodeComponent(symbol)}&apikey=${Uri.encodeComponent(apiKey)}',
      );
      final res = await _http.get(uri).timeout(const Duration(seconds: 15));
      if (res.statusCode != 200) return null;

      final decoded = jsonDecode(res.body);
      if (decoded is! Map<String, dynamic>) return null;

      if (decoded.containsKey('Note') || decoded.containsKey('Information')) {
        debugPrint('Alpha Vantage rate limit / info for $symbol');
        return null;
      }

      final gq = decoded['Global Quote'];
      if (gq is! Map<String, dynamic>) return null;

      final priceRaw = gq['05. price'] ?? gq['05. Price'];
      if (priceRaw == null) return null;

      final price = double.tryParse(priceRaw.toString());
      if (price == null) return null;

      final sym = gq['01. symbol']?.toString() ?? symbol;

      return FinancialQuote(
        symbol: sym,
        shortName: sym,
        price: price,
        currency: 'USD',
        changePercent: null,
      );
    } on OfflineException {
      rethrow;
    } catch (e, st) {
      debugPrint('Alpha Vantage parse $symbol: $e\n$st');
      return null;
    }
  }
}
