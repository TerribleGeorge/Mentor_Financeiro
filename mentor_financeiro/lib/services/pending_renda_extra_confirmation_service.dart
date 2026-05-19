import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'daily_spend_limit_notifier.dart';
import 'finance_config_signals.dart';
import 'locale_ui_strings.dart';
import 'localization_service.dart';
import 'renda_extra_notification_increment.dart';

/// Fila de entradas (PIX recebido, etc.) até o utilizador confirmar em diálogo.
class PendingRendaExtraConfirmationService {
  PendingRendaExtraConfirmationService._();

  static const _prefsKey = 'pending_renda_extra_confirm_v1';
  static const _maxItems = 30;

  static String _itemId({
    required String uid,
    required String packageName,
    required int timestamp,
  }) => '$uid|$packageName|$timestamp';

  static Future<bool> enqueueIfNew({
    required String uid,
    required String packageName,
    required int timestamp,
    required double valor,
    required String resumo,
  }) async {
    final id = _itemId(
      uid: uid,
      packageName: packageName,
      timestamp: timestamp,
    );
    final prefs = await SharedPreferences.getInstance();
    final list = await _readList(prefs);
    if (list.any((e) => e['id'] == id)) return false;

    var snippet = resumo.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (snippet.length > 320) {
      snippet = '${snippet.substring(0, 320)}…';
    }

    list.insert(0, {'id': id, 'uid': uid, 'valor': valor, 'resumo': snippet});
    while (list.length > _maxItems) {
      list.removeLast();
    }
    await _writeList(prefs, list);
    return true;
  }

  /// Mostra um diálogo por item na fila (FIFO do mais recente).
  static Future<void> tryShowNext(BuildContext context) async {
    if (!context.mounted) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    while (context.mounted) {
      final prefs = await SharedPreferences.getInstance();
      final full = await _readList(prefs);
      final idx = full.indexWhere((e) => e['uid'] == user.uid);
      if (idx < 0) break;

      final item = full.removeAt(idx);
      await _writeList(prefs, full);

      final valor = (item['valor'] as num?)?.toDouble() ?? 0;
      if (valor <= 0) continue;

      final resumo = item['resumo']?.toString() ?? '';

      if (!context.mounted) return;
      final sim = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          final scheme = Theme.of(ctx).colorScheme;
          final strings = LocaleUiStrings.of(ctx);
          return AlertDialog(
            title: Text(
              strings.text(
                'Renda extra',
                en: 'Extra income',
                es: 'Ingreso extra',
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings.text(
                      'Reconheci que você recebeu um valor na sua conta. '
                      'Devo registrar como renda extra?',
                      en:
                          'I detected that you received money in your account. '
                          'Should I record it as extra income?',
                      es:
                          'Detecté que recibiste un valor en tu cuenta. '
                          '¿Debo registrarlo como ingreso extra?',
                    ),
                    style: TextStyle(color: scheme.onSurface, height: 1.35),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    LocalizationService.formatCurrency(valor),
                    style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: scheme.primary,
                    ),
                  ),
                  if (resumo.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(
                      resumo,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: scheme.onSurface.withValues(alpha: 0.72),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text(strings.text('Não', en: 'No', es: 'No')),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: Text(strings.text('Sim', en: 'Yes', es: 'Sí')),
              ),
            ],
          );
        },
      );

      if (!context.mounted) break;
      if (sim == true) {
        final ok = await incrementarRendaExtraNotificacaoConfirmada(
          uid: user.uid,
          valorIncremento: valor,
        );
        if (ok) {
          FinanceConfigSignals.notifySaved();
          await DailySpendLimitNotifier.evaluateFromPrefsToday();
        }
      }
    }
  }

  static Future<List<Map<String, dynamic>>> _readList(
    SharedPreferences prefs,
  ) async {
    final raw = prefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) return <Map<String, dynamic>>[];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return <Map<String, dynamic>>[];
      return decoded
          .whereType<Map>()
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    } catch (_) {
      return <Map<String, dynamic>>[];
    }
  }

  static Future<void> _writeList(
    SharedPreferences prefs,
    List<Map<String, dynamic>> list,
  ) async {
    if (list.isEmpty) {
      await prefs.remove(_prefsKey);
    } else {
      await prefs.setString(_prefsKey, jsonEncode(list));
    }
  }
}
