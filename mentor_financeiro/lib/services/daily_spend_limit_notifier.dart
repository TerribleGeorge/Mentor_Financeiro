import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';

/// Avisos locais (Android) quando o gasto do dia se aproxima ou ultrapassa o guia
/// "limite hoje" (teto + fórmula em [DailyLimitCalculator]).
///
/// O motor Flutter precisa de estar a correr para [onSpendUpdated] ser chamado; ao
/// voltar ao primeiro plano, [evaluateFromPrefsToday] reavalia o dia corrente.
class DailySpendLimitNotifier {
  DailySpendLimitNotifier._();

  static const MethodChannel _channel = MethodChannel(
    'mentor_financeiro/notifications',
  );

  /// Fase já notificada neste dia: 0 = nada; 1 = ≥80 %; 2 = ≥100 %.
  static String phaseKey(String yyyyMmDd) =>
      'daily_limit_notif_phase_v1_$yyyyMmDd';

  static String? _dateFromGastosKey(String key) {
    if (!key.startsWith('gastos_')) return null;
    final d = key.substring('gastos_'.length);
    if (d.length != 10) return null;
    return d;
  }

  static String _fmtBrl(double v) =>
      NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(v);

  /// Chamar após gravar `gastos_YYYY-MM-DD` (ex.: notificação bancária).
  static Future<void> onSpendUpdated({
    required SharedPreferences prefs,
    required String gastosDayKey,
    required double newTotal,
  }) async {
    final date = _dateFromGastosKey(gastosDayKey);
    if (date == null) return;
    if (!Platform.isAndroid) return;
    await _evaluate(prefs, date, newTotal);
  }

  /// Ao reabrir o app: reavalia o dia corrente (gastos que ficaram na fila, etc.).
  static Future<void> evaluateFromPrefsToday() async {
    if (!Platform.isAndroid) return;
    final prefs = await SharedPreferences.getInstance();
    final date = DateTime.now().toIso8601String().split('T')[0];
    final total = prefs.getDouble('gastos_$date') ?? 0.0;
    await _evaluate(prefs, date, total);
  }

  /// Após mudar o teto ou finanças: permite voltar a avisar com o novo limite.
  static Future<void> clearPhaseForDate(
    SharedPreferences prefs,
    String yyyyMmDd,
  ) async {
    await prefs.remove(phaseKey(yyyyMmDd));
  }

  static Future<void> _evaluate(
    SharedPreferences prefs,
    String date,
    double spent,
  ) async {
    final limit = DailyLimitCalculator.computeFromPrefs(prefs).displayLimit;
    if (limit <= 0) return;

    final ratio = spent / limit;
    final phase = ratio >= 1.0 ? 2 : (ratio >= 0.8 ? 1 : 0);
    if (phase == 0) return;

    final key = phaseKey(date);
    final last = prefs.getInt(key) ?? 0;
    if (phase <= last) return;

    final String title;
    final String body;
    final int notifId;
    if (phase == 2) {
      title = 'Limite diário ultrapassado';
      body =
          'Gastos de hoje (${_fmtBrl(spent)}) passaram do teu guia (${_fmtBrl(limit)}). Abre o Mentor Financeiro para rever.';
      notifId = 4211;
    } else {
      title = 'Perto do limite de gastos hoje';
      body =
          'Já gastaste ${_fmtBrl(spent)} de ${_fmtBrl(limit)} (~${(ratio * 100).round()}%). Atenção ao teto do dia.';
      notifId = 4210;
    }

    try {
      final ok = await _channel.invokeMethod<bool>('showDailyBudgetNotification', {
        'title': title,
        'body': body,
        'notificationId': notifId,
      });
      if (ok == true) {
        await prefs.setInt(key, phase);
      }
    } on PlatformException catch (_) {
      // POST_NOTIFICATIONS negado ou canal indisponível.
    }
  }
}
