import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExchangeRatesSnapshot {
  final String base;
  final Map<String, double> rates;
  final DateTime fetchedAt;

  ExchangeRatesSnapshot({
    required this.base,
    required this.rates,
    required this.fetchedAt,
  });

  double? rateTo(String currency) => rates[currency.toUpperCase()];
}

class ExchangeRateService {
  static const _cachePrefix = 'fx_cache_';
  static const _datePrefix = 'fx_cache_date_';

  /// Busca taxas de câmbio mais recentes (todas as moedas suportadas pela API)
  /// e faz cache por dia (YYYY-MM-DD) para evitar bater na rede toda hora.
  static Future<ExchangeRatesSnapshot?> getLatest({
    String base = 'USD',
    bool forceRefresh = false,
  }) async {
    final baseUpper = base.toUpperCase();
    final prefs = await SharedPreferences.getInstance();
    final today = _yyyyMmDd(DateTime.now());

    if (!forceRefresh) {
      final lastDay = prefs.getString('$_datePrefix$baseUpper');
      final cached = prefs.getString('$_cachePrefix$baseUpper');
      if (lastDay == today && cached != null) {
        final decoded = jsonDecode(cached) as Map<String, dynamic>;
        return _fromJson(baseUpper, decoded);
      }
    }

    try {
      final uri = Uri.parse('https://open.er-api.com/v6/latest/$baseUpper');
      final res = await http.get(uri);
      if (res.statusCode != 200) {
        return await _loadFallback(baseUpper, prefs);
      }

      final decoded = jsonDecode(res.body) as Map<String, dynamic>;
      final snapshot = _fromApiResponse(baseUpper, decoded);
      if (snapshot == null) {
        return await _loadFallback(baseUpper, prefs);
      }

      await prefs.setString('$_datePrefix$baseUpper', today);
      await prefs.setString('$_cachePrefix$baseUpper', jsonEncode(decoded));
      return snapshot;
    } catch (e) {
      debugPrint('Erro ao buscar câmbio: $e');
      return await _loadFallback(baseUpper, prefs);
    }
  }

  static Future<ExchangeRatesSnapshot?> _loadFallback(
    String baseUpper,
    SharedPreferences prefs,
  ) async {
    final cached = prefs.getString('$_cachePrefix$baseUpper');
    if (cached == null) return null;
    try {
      final decoded = jsonDecode(cached) as Map<String, dynamic>;
      return _fromJson(baseUpper, decoded);
    } catch (_) {
      return null;
    }
  }

  static ExchangeRatesSnapshot? _fromJson(
    String baseUpper,
    Map<String, dynamic> decoded,
  ) {
    return _fromApiResponse(baseUpper, decoded);
  }

  static ExchangeRatesSnapshot? _fromApiResponse(
    String baseUpper,
    Map<String, dynamic> decoded,
  ) {
    final ratesRaw = decoded['rates'];
    if (ratesRaw is! Map) return null;

    final rates = <String, double>{};
    for (final entry in ratesRaw.entries) {
      final code = entry.key?.toString().toUpperCase();
      if (code == null || code.isEmpty) continue;
      final v = entry.value;
      if (v is num) {
        rates[code] = v.toDouble();
      }
    }

    final timeLastUpdateUnix = decoded['time_last_update_unix'];
    DateTime fetchedAt = DateTime.now();
    if (timeLastUpdateUnix is num) {
      fetchedAt = DateTime.fromMillisecondsSinceEpoch(
        timeLastUpdateUnix.toInt() * 1000,
      );
    }

    return ExchangeRatesSnapshot(
      base: baseUpper,
      rates: rates,
      fetchedAt: fetchedAt,
    );
  }

  static String _yyyyMmDd(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final m = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}

