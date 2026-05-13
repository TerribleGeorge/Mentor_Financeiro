import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../data/providers/brazilian_financial_data_provider.dart';
import '../data/providers/yahoo_financial_data_provider.dart';
import '../domain/entities/financial_quote.dart';
import '../models/investimento_model.dart';
import 'exchange_rate_service.dart';
import 'localization_service.dart';

class MarketAlertService {
  MarketAlertService._();
  static final MarketAlertService instance = MarketAlertService._();

  static const MethodChannel _channel = MethodChannel(
    'mentor_financeiro/notifications',
  );

  static const _currencySnapshotKey = 'market_alert_currency_snapshot_v1';
  static const _quoteSnapshotKey = 'market_alert_quote_snapshot_v1';
  static const _fixedRateSnapshotKey = 'market_alert_fixed_rate_snapshot_v1';
  static const _lastNotificationKey = 'market_alert_last_notification_v1';

  static const _minCurrencyChangePct = 1.0;
  static const _minInvestmentChangePct = 2.0;
  static const _minRateChangePoints = 0.10;
  static const _minNotificationInterval = Duration(hours: 6);

  Timer? _timer;
  bool _running = false;

  void start() {
    _timer ??= Timer.periodic(const Duration(hours: 2), (_) {
      unawaited(checkNow());
    });
    unawaited(checkNow());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> checkNow() async {
    if (_running || !Platform.isAndroid) return;
    _running = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final alerts = <String>[
        ...await _currencyAlerts(prefs),
        ...await _investmentQuoteAlerts(prefs),
        ...await _fixedIncomeRateAlerts(prefs),
      ];

      if (alerts.isEmpty) return;
      if (!_canNotify(prefs)) return;

      final visible = alerts.take(3).toList();
      final extra = alerts.length - visible.length;
      final body = extra > 0
          ? '${visible.join(' • ')} • +$extra alerta(s) no app'
          : visible.join(' • ');

      final ok = await _channel.invokeMethod<bool>('showMentorNotification', {
        'title': 'Atualização do mercado',
        'body': body,
      });
      if (ok == true) {
        await prefs.setInt(
          _lastNotificationKey,
          DateTime.now().millisecondsSinceEpoch,
        );
      }
    } catch (_) {
      // Alertas de mercado não podem atrapalhar a navegação do app.
    } finally {
      _running = false;
    }
  }

  bool _canNotify(SharedPreferences prefs) {
    final last = prefs.getInt(_lastNotificationKey) ?? 0;
    if (last <= 0) return true;
    final elapsed = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(last),
    );
    return elapsed >= _minNotificationInterval;
  }

  Future<List<String>> _currencyAlerts(SharedPreferences prefs) async {
    final base = LocalizationService.currencyCode;
    final targets = <String>[
      'USD',
      'EUR',
      'GBP',
      'JPY',
      'CHF',
      'CAD',
      'AUD',
    ].where((code) => code != base).toList();
    final snap = await ExchangeRateService.getLatest(base: base);
    if (snap == null) return const [];

    final previous = _decodeDoubleMap(prefs.getString(_currencySnapshotKey));
    final current = <String, double>{};
    final alerts = <String>[];

    for (final code in targets) {
      final rate = snap.rateTo(code);
      if (rate == null || rate <= 0) continue;
      final localPerUnit = 1 / rate;
      current[code] = localPerUnit;

      final old = previous[code];
      if (old == null || old <= 0) continue;
      final change = ((localPerUnit - old) / old) * 100;
      if (change.abs() >= _minCurrencyChangePct) {
        alerts.add(
          '$code ${change > 0 ? 'valorizou' : 'desvalorizou'} ${change.abs().toStringAsFixed(1)}% frente a ${snap.base}',
        );
      }
    }

    if (current.isNotEmpty) {
      await prefs.setString(_currencySnapshotKey, jsonEncode(current));
    }
    return alerts;
  }

  Future<List<String>> _investmentQuoteAlerts(SharedPreferences prefs) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const [];

    final docs = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user.uid)
        .collection('investimentos')
        .get();

    final investments = docs.docs
        .map((doc) => InvestimentoModel.fromDoc(doc.id, doc.data()))
        .where((i) => (i.yahooSymbol ?? '').trim().isNotEmpty)
        .toList();
    if (investments.isEmpty) return const [];

    final symbols = investments
        .map((i) => i.yahooSymbol!.trim().toUpperCase())
        .toSet()
        .take(12)
        .toList();
    final br = symbols.where((s) => s.endsWith('.SA')).toList();
    final global = symbols.where((s) => !s.endsWith('.SA')).toList();

    final quotes = <FinancialQuote>[];
    if (br.isNotEmpty) {
      try {
        quotes.addAll(
          (await BrazilianFinancialDataProvider().fetchQuotes(br)).quotes,
        );
      } catch (_) {}
    }
    if (global.isNotEmpty) {
      try {
        quotes.addAll(
          (await YahooFinancialDataProvider().fetchQuotes(global)).quotes,
        );
      } catch (_) {}
    }

    final previous = _decodeDoubleMap(prefs.getString(_quoteSnapshotKey));
    final current = <String, double>{};
    final alerts = <String>[];

    for (final quote in quotes) {
      current[quote.symbol] = quote.price;
      final daily = quote.changePercent;
      if (daily != null && daily.abs() >= _minInvestmentChangePct) {
        alerts.add(
          '${quote.symbol} ${daily > 0 ? 'subiu' : 'caiu'} ${daily.abs().toStringAsFixed(1)}% hoje',
        );
        continue;
      }

      final old = previous[quote.symbol];
      if (old == null || old <= 0) continue;
      final change = ((quote.price - old) / old) * 100;
      if (change.abs() >= _minInvestmentChangePct) {
        alerts.add(
          '${quote.symbol} ${change > 0 ? 'valorizou' : 'desvalorizou'} ${change.abs().toStringAsFixed(1)}%',
        );
      }
    }

    if (current.isNotEmpty) {
      await prefs.setString(_quoteSnapshotKey, jsonEncode(current));
    }
    return alerts;
  }

  Future<List<String>> _fixedIncomeRateAlerts(SharedPreferences prefs) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const [];

    final docs = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user.uid)
        .collection('investimentos')
        .where(
          'tipoId',
          whereIn: ['poupanca', 'tesouro_direto', 'cdb', 'lci_lca'],
        )
        .limit(1)
        .get();
    if (docs.docs.isEmpty) return const [];

    final currentRate = await _fetchSelicRate();
    if (currentRate == null) return const [];

    final previous = prefs.getDouble(_fixedRateSnapshotKey);
    await prefs.setDouble(_fixedRateSnapshotKey, currentRate);
    if (previous == null) return const [];

    final change = currentRate - previous;
    if (change.abs() < _minRateChangePoints) return const [];

    return [
      'Selic ${change > 0 ? 'subiu' : 'caiu'} ${change.abs().toStringAsFixed(2)} ponto(s)',
    ];
  }

  Future<double?> _fetchSelicRate() async {
    final res = await http
        .get(
          Uri.parse(
            'https://api.bcb.gov.br/dados/serie/bcdata.sgs.432/dados/ultimos/1?formato=json',
          ),
        )
        .timeout(const Duration(seconds: 12));
    if (res.statusCode != 200) return null;
    final snap = jsonDecode(res.body);
    if (snap is! List || snap.isEmpty) return null;
    final first = snap.first;
    if (first is! Map<String, dynamic>) return null;
    final raw = first['valor']?.toString().replaceAll(',', '.');
    return double.tryParse(raw ?? '');
  }

  Map<String, double> _decodeDoubleMap(String? raw) {
    if (raw == null || raw.isEmpty) return <String, double>{};
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return <String, double>{};
      final out = <String, double>{};
      for (final entry in decoded.entries) {
        final value = entry.value;
        final number = value is num
            ? value.toDouble()
            : double.tryParse('$value');
        if (number != null && number > 0) {
          out['${entry.key}'] = number;
        }
      }
      return out;
    } catch (_) {
      return <String, double>{};
    }
  }
}
