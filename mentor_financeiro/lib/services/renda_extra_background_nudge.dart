import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/connectivity_service.dart';
import 'localization_service.dart';

/// Lembrete local quando há entrada (PIX, etc.) pendente de confirmação em **Renda extra**
/// e a app não está em primeiro plano — convida a abrir o app antes de limpar a bandeja.
class RendaExtraBackgroundNudge {
  RendaExtraBackgroundNudge._();

  static const MethodChannel _channel = MethodChannel(
    'mentor_financeiro/notifications',
  );

  static const _prefsThrottleKey = 'renda_extra_last_nudge_ms';
  static const _minInterval = Duration(seconds: 90);
  static const _notificationIdBase = 4320;

  static Future<void> tryNotifyIfBackground({required double valor}) async {
    if (!Platform.isAndroid) return;
    if (!await ConnectivityService.isOnline()) return;

    final life = WidgetsBinding.instance.lifecycleState;
    if (life == AppLifecycleState.resumed) return;

    final prefs = await SharedPreferences.getInstance();
    final last = prefs.getInt(_prefsThrottleKey) ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - last < _minInterval.inMilliseconds) return;

    final title = 'Recebeste um valor';
    final body =
        'Detectámos uma entrada de ${LocalizationService.formatCurrency(valor)}. '
        'Abre o Mentor Financeiro e confirma se queres somar em Renda extra antes de '
        'apagares a notificação do banco.';

    try {
      final ok = await _channel.invokeMethod<bool>('showMentorNotification', {
        'title': title,
        'body': body,
        'notificationId': _notificationIdBase + (now % 180),
      });
      if (ok == true) {
        await prefs.setInt(_prefsThrottleKey, now);
      }
    } on PlatformException catch (_) {
      // POST_NOTIFICATIONS negado ou falha nativa.
    }
  }
}
