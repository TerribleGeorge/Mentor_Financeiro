import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Conjunto de taxas (ex.: tabela completa a partir de uma moeda base).
class ExchangeRatesSnapshot {
  const ExchangeRatesSnapshot({
    required this.base,
    required this.fetchedAt,
    required this.rates,
  });

  final String base;
  final DateTime fetchedAt;
  final Map<String, double> rates;

  /// Taxa de 1 unidade [base] para [currency] (ex.: USD→BRL).
  double? rateTo(String currency) => rates[currency.toUpperCase()];
}

class _CachedSnapshot {
  _CachedSnapshot(this.snapshot, this.expires);

  final ExchangeRatesSnapshot snapshot;
  final DateTime expires;
}

class _CachedRate {
  _CachedRate(this.rate, this.expires);

  final double rate;
  final DateTime expires;
}

/// Taxas via [Frankfurter](https://www.frankfurter.app/) (ECB), sem chave.
abstract final class ExchangeRateService {
  static final Map<String, _CachedSnapshot> _tableCache = {};
  static final Map<String, _CachedRate> _pairCache = {};

  static const _ttlTable = Duration(hours: 1);
  static const _ttlPair = Duration(hours: 1);

  /// Últimas taxas com [base] como moeda de origem (ex.: USD → todas as outras).
  static Future<ExchangeRatesSnapshot?> getLatest({
    String base = 'USD',
    bool forceRefresh = false,
  }) async {
    final key = base.toUpperCase();
    if (!forceRefresh) {
      final c = _tableCache[key];
      if (c != null && c.expires.isAfter(DateTime.now())) {
        return c.snapshot;
      }
    }

    try {
      final uri = Uri.parse(
        'https://api.frankfurter.app/latest?from=$key',
      );
      final res = await http.get(uri).timeout(const Duration(seconds: 15));
      if (res.statusCode != 200) {
        debugPrint('ExchangeRateService getLatest HTTP ${res.statusCode}');
        return null;
      }

      final decoded = jsonDecode(res.body);
      if (decoded is! Map<String, dynamic>) return null;

      final ratesRaw = decoded['rates'];
      if (ratesRaw is! Map<String, dynamic>) return null;

      final rates = <String, double>{};
      for (final e in ratesRaw.entries) {
        final v = e.value;
        if (v is num) {
          rates[e.key] = v.toDouble();
        }
      }

      final snap = ExchangeRatesSnapshot(
        base: key,
        fetchedAt: DateTime.now().toUtc(),
        rates: rates,
      );
      _tableCache[key] = _CachedSnapshot(
        snap,
        DateTime.now().add(_ttlTable),
      );
      return snap;
    } catch (e, st) {
      debugPrint('ExchangeRateService getLatest: $e\n$st');
      return null;
    }
  }

  /// Converte um valor em **BRL** para [targetCurrency] (ISO 4217).
  static Future<double?> convertFromBrl(double amountBrl, String targetCurrency) async {
    final rate = await rateBrlTo(targetCurrency);
    if (rate == null) return null;
    return amountBrl * rate;
  }

  /// Uma unidade BRL vale quantas unidades de [targetCurrency].
  static Future<double?> rateBrlTo(String targetCurrency) async {
    final upper = targetCurrency.toUpperCase();
    if (upper == 'BRL') return 1.0;

    final cached = _pairCache[upper];
    if (cached != null && cached.expires.isAfter(DateTime.now())) {
      return cached.rate;
    }

    try {
      final uri = Uri.parse(
        'https://api.frankfurter.app/latest?from=BRL&to=$upper',
      );
      final res = await http.get(uri).timeout(const Duration(seconds: 12));
      if (res.statusCode != 200) {
        debugPrint('ExchangeRateService rateBrlTo HTTP ${res.statusCode}');
        return null;
      }

      final decoded = jsonDecode(res.body);
      if (decoded is! Map<String, dynamic>) return null;

      final rates = decoded['rates'];
      if (rates is! Map<String, dynamic>) return null;

      final raw = rates[upper];
      if (raw is! num) return null;

      final rate = raw.toDouble();
      _pairCache[upper] = _CachedRate(rate, DateTime.now().add(_ttlPair));
      return rate;
    } catch (e, st) {
      debugPrint('ExchangeRateService rateBrlTo: $e\n$st');
      return null;
    }
  }

  /// Converte [amount] entre moedas ISO usando a tabela Frankfurter para [fromCurrency].
  static Future<double?> convertAmount(
    double amount,
    String fromCurrency,
    String toCurrency,
  ) async {
    final from = fromCurrency.toUpperCase();
    final to = toCurrency.toUpperCase();
    if (from == to) return amount;

    final snap = await getLatest(base: from);
    final rate = snap?.rateTo(to);
    if (rate == null) return null;
    return amount * rate;
  }
}
