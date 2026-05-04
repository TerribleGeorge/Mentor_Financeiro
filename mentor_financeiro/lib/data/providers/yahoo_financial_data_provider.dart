import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/network/connectivity_service.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/financial_quote.dart';
import '../../domain/entities/market_data_snapshot.dart';
import '../../domain/repositories/i_financial_data_provider.dart';

/// Provedor global usando o endpoint público de chart da Yahoo Finance (sem SDK).
class YahooFinancialDataProvider implements IFinancialDataProvider {
  YahooFinancialDataProvider({http.Client? httpClient})
    : _http = httpClient ?? http.Client();

  final http.Client _http;

  @override
  String get providerId => 'yahoo_global';

  @override
  FinancialMarketRegion get region => FinancialMarketRegion.global;

  @override
  Future<MarketDataSnapshot> fetchQuotes(List<String> symbols) async {
    final quotes = <FinancialQuote>[];
    final now = DateTime.now().toUtc();
    var ensuredOnline = false;

    for (final raw in symbols) {
      final symbol = raw.trim().toUpperCase();
      if (symbol.isEmpty) continue;

      if (!ensuredOnline) {
        await ConnectivityService.requireOnline();
        ensuredOnline = true;
      }

      final uri = Uri.parse(
        'https://query1.finance.yahoo.com/v8/finance/chart/$symbol'
        '?interval=1d&range=1d',
      );

      final res = await _http.get(
        uri,
        headers: const {
          'User-Agent': 'MentorFinanceiro/1.0 (+https://localhost)',
          'Accept': 'application/json',
        },
      );
      if (res.statusCode != 200) {
        debugPrint('YahooFinancialDataProvider $symbol HTTP ${res.statusCode}');
        continue;
      }

      try {
        final decoded = jsonDecode(res.body);
        if (decoded is! Map<String, dynamic>) continue;

        final chart = decoded['chart'];
        if (chart is! Map<String, dynamic>) continue;

        final results = chart['result'];
        if (results is! List<dynamic> || results.isEmpty) continue;

        final first = results.first;
        if (first is! Map<String, dynamic>) continue;

        final meta = first['meta'];
        if (meta is! Map<String, dynamic>) continue;

        final priceRaw = meta['regularMarketPrice'];
        if (priceRaw is! num) continue;

        double? changePct;
        final prevClose = meta['previousClose'];
        if (prevClose is num && prevClose != 0) {
          changePct = ((priceRaw.toDouble() - prevClose.toDouble()) / prevClose.toDouble()) * 100;
        }

        quotes.add(
          FinancialQuote(
            symbol: symbol,
            shortName: meta['shortName']?.toString(),
            price: priceRaw.toDouble(),
            currency: meta['currency']?.toString() ?? 'USD',
            changePercent: changePct,
          ),
        );
      } catch (e, st) {
        debugPrint('Yahoo parse error $symbol: $e\n$st');
      }
    }

    return MarketDataSnapshot(
      providerId: providerId,
      fetchedAt: now,
      quotes: quotes,
    );
  }
}
