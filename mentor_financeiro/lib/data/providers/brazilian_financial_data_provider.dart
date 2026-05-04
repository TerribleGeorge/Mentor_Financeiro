import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/network/connectivity_service.dart';
import '../../core/network/offline_exception.dart';
import '../services/market_quotes_cache.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/financial_quote.dart';
import '../../domain/entities/market_data_snapshot.dart';
import '../../domain/repositories/i_financial_data_provider.dart';

/// Provedor Brasil via [brapi.dev](https://brapi.dev) (REST estável para B3).
///
/// Alternativa comercial como UOL/B3 pode substituir esta classe mantendo o mesmo contrato.
class BrazilianFinancialDataProvider implements IFinancialDataProvider {
  BrazilianFinancialDataProvider({http.Client? httpClient})
    : _http = httpClient ?? http.Client();

  final http.Client _http;

  @override
  String get providerId => 'brapi_br';

  @override
  FinancialMarketRegion get region => FinancialMarketRegion.brazil;

  @override
  Future<MarketDataSnapshot> fetchQuotes(List<String> symbols) async {
    final clean = symbols.map((s) => s.trim().toUpperCase()).where((s) => s.isNotEmpty).toList();
    if (clean.isEmpty) {
      return MarketDataSnapshot(
        providerId: providerId,
        fetchedAt: DateTime.now().toUtc(),
        quotes: const [],
      );
    }

    try {
      await ConnectivityService.requireOnline();

      final uri = Uri.parse('https://brapi.dev/api/quote/${clean.join(',')}');
      final res = await _http.get(
        uri,
        headers: const {
          'User-Agent': 'MentorFinanceiro/1.0 (+https://localhost)',
          'Accept': 'application/json',
        },
      );

      if (res.statusCode != 200) {
        debugPrint('BrazilianFinancialDataProvider HTTP ${res.statusCode}: ${res.body}');
        throw Exception('Falha ao obter cotações BR (${res.statusCode}).');
      }

      final decoded = jsonDecode(res.body);
      if (decoded is! Map<String, dynamic>) {
        throw const FormatException('Resposta BR inválida.');
      }

      final results = decoded['results'];
      if (results is! List<dynamic>) {
        throw const FormatException('Campo results ausente.');
      }

      final quotes = <FinancialQuote>[];
      for (final row in results) {
        if (row is! Map<String, dynamic>) continue;
        final symbol = row['symbol']?.toString();
        final priceRaw = row['regularMarketPrice'];
        if (symbol == null || symbol.isEmpty || priceRaw == null) continue;

        double? changePct;
        final ch = row['regularMarketChangePercent'];
        if (ch is num) changePct = ch.toDouble();

        quotes.add(
          FinancialQuote(
            symbol: symbol,
            shortName: row['shortName']?.toString(),
            price: (priceRaw as num).toDouble(),
            currency: row['currency']?.toString() ?? 'BRL',
            changePercent: changePct,
          ),
        );
      }

      final snapshot = MarketDataSnapshot(
        providerId: providerId,
        fetchedAt: DateTime.now().toUtc(),
        quotes: quotes,
      );
      MarketQuotesCache.instance.remember(providerId, snapshot);
      return snapshot;
    } on OfflineException {
      rethrow;
    } catch (e, st) {
      debugPrint('BrazilianFinancialDataProvider falha de rede/API: $e\n$st');
      final cached = MarketQuotesCache.instance.peek(providerId);
      if (cached != null && cached.quotes.isNotEmpty) {
        return cached;
      }
      rethrow;
    }
  }
}
