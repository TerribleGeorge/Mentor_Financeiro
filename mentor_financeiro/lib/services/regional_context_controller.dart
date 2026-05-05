import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/entities/financial_market_region.dart';

/// Origem do país/detecção (telemetria / debugging).
enum RegionalDetectionSource { locale, cached, ip, manual }

/// Estado global: país do utilizador para mercado (B3 vs internacional) e catálogos de investimento.
class RegionalContextController extends ChangeNotifier {
  RegionalContextController();

  static const _kManualCountry = 'regional_country_manual';
  static const _kAutoCountry = 'regional_country_auto';

  String _countryCode = 'BR';
  RegionalDetectionSource _source = RegionalDetectionSource.locale;

  /// ISO 3166-1 alpha-2 (ex.: BR, US, PT).
  String get countryCode => _countryCode;

  RegionalDetectionSource get detectionSource => _source;

  bool get isBrazil => _countryCode.toUpperCase() == 'BR';

  FinancialMarketRegion get marketRegion =>
      isBrazil ? FinancialMarketRegion.brazil : FinancialMarketRegion.global;

  /// País inferido ou guardado; refinamento por IP corre em segundo plano.
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    final manual = prefs.getString(_kManualCountry)?.trim();
    if (manual != null && manual.length == 2) {
      _countryCode = manual.toUpperCase();
      _source = RegionalDetectionSource.manual;
      notifyListeners();
      return;
    }

    final cached = prefs.getString(_kAutoCountry)?.trim();
    final locale = SchedulerBinding.instance.platformDispatcher.locale;
    final fromLocale =
        (locale.countryCode != null && locale.countryCode!.length == 2)
            ? locale.countryCode!.toUpperCase()
            : 'BR';

    _countryCode = (cached != null && cached.length == 2)
        ? cached.toUpperCase()
        : fromLocale;
    _source = cached != null
        ? RegionalDetectionSource.cached
        : RegionalDetectionSource.locale;

    await prefs.setString(_kAutoCountry, _countryCode);
    notifyListeners();

    unawaited(_refineCountryFromIp(prefs));
  }

  Future<void> _refineCountryFromIp(SharedPreferences prefs) async {
    if (prefs.getString(_kManualCountry) != null) return;

    try {
      final res = await http
          .get(Uri.parse('https://ipwho.is/'))
          .timeout(const Duration(seconds: 8));
      if (res.statusCode != 200) return;

      final json = jsonDecode(res.body);
      if (json is! Map<String, dynamic>) return;

      final success = json['success'];
      if (success == false) return;

      final cc = json['country_code'];
      if (cc is! String || cc.length != 2) return;

      final upper = cc.toUpperCase();
      if (upper == _countryCode) return;

      _countryCode = upper;
      _source = RegionalDetectionSource.ip;
      await prefs.setString(_kAutoCountry, upper);
      notifyListeners();
    } catch (e, st) {
      debugPrint('RegionalContext IP: $e\n$st');
    }
  }

  /// Preferência explícita do utilizador (persistente).
  Future<void> setCountryCodeManual(String isoTwoLetter) async {
    final code = isoTwoLetter.trim().toUpperCase();
    if (code.length != 2) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kManualCountry, code);

    _countryCode = code;
    _source = RegionalDetectionSource.manual;
    notifyListeners();
  }

  /// Remove override manual e volta à detecção automática.
  Future<void> clearManualCountry() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kManualCountry);
    await initialize();
  }
}
