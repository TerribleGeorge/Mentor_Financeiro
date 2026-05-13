import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';

String _formatarValorPrefsPtBr(double valor) {
  if (valor.abs() < 1e-9) return '';
  return NumberFormat('#,##0.00', 'pt_BR').format(valor);
}

/// Incrementa **Renda Extra** em prefs + Firestore (após confirmação do utilizador).
Future<bool> incrementarRendaExtraNotificacaoConfirmada({
  required String uid,
  required double valorIncremento,
}) async {
  if (valorIncremento <= 0) return false;
  final prefs = await SharedPreferences.getInstance();
  final nomeCampo = kFinanceIncomePrefFieldNames[1];
  final atual = DailyLimitCalculator.parseMoney(
    prefs.getString('valor_$nomeCampo'),
  );
  final novo = atual + valorIncremento;
  final textoFmt = _formatarValorPrefsPtBr(novo);
  await prefs.setString('valor_$nomeCampo', textoFmt);
  await prefs.setBool('ativo_$nomeCampo', true);

  try {
    await FirebaseFirestore.instance.collection('usuarios').doc(uid).set(
      {
        'configuracoes': {
          nomeCampo: {'valor': novo, 'ativo': true},
        },
      },
      SetOptions(merge: true),
    );
  } catch (e) {
    if (kDebugMode) {
      debugPrint('Firestore merge Renda Extra: $e');
    }
  }
  return true;
}
