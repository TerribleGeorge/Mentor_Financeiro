import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Nomes dos campos de despesa em [TelaConfiguracao] (`valor_*` / `ativo_*`).
/// Manter alinhado à lista de campos da tela de configuração.
const List<String> kFinanceExpensePrefFieldNames = [
  'Aluguel',
  'Pensão',
  'Condomínio',
  'Internet',
  'Luz',
  'Gás',
  'Mercado',
  'Academia',
  'Cartão',
  'Seguro',
  'Transporte',
  'Reserva Emergência',
];

const List<String> kFinanceIncomePrefFieldNames = [
  'Renda Fixa',
  'Renda Extra',
];

const String kSaldoAtualPrefFieldName = 'Saldo Atual';

class DailyLimitResult {
  const DailyLimitResult({
    required this.displayLimit,
    required this.rawLimit,
    required this.showNonPositiveAlert,
    required this.alertMessage,
    required this.diasRestantes,
    required this.saldoAtual,
    required this.rendaMensal,
    required this.gastosFixosMensal,
  });

  /// Limite exibido (nunca negativo).
  final double displayLimit;

  /// Valor bruto antes de truncar em zero para exibição.
  final double rawLimit;

  final bool showNonPositiveAlert;
  final String? alertMessage;
  final int diasRestantes;
  final double saldoAtual;
  final double rendaMensal;
  final double gastosFixosMensal;
}

class DailyLimitCalculator {
  DailyLimitCalculator._();

  static double _parseMoney(String? s) =>
      double.tryParse(s?.replaceAll(',', '.') ?? '0') ?? 0;

  static String _formatBrl(double value) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(value);
  }

  /// Se [ativo_*] nunca foi salvo, considera ativo apenas quando há valor gravado.
  static bool _fieldCounts(SharedPreferences prefs, String name) {
    final ativo = prefs.getBool('ativo_$name');
    if (ativo != null) return ativo;
    final raw = prefs.getString('valor_$name');
    return raw != null && raw.trim().isNotEmpty;
  }

  static double _sumIncome(SharedPreferences prefs) {
    var t = 0.0;
    for (final name in kFinanceIncomePrefFieldNames) {
      if (_fieldCounts(prefs, name)) {
        t += _parseMoney(prefs.getString('valor_$name'));
      }
    }
    return t;
  }

  static double _sumExpenses(SharedPreferences prefs) {
    var t = 0.0;
    for (final name in kFinanceExpensePrefFieldNames) {
      if (_fieldCounts(prefs, name)) {
        t += _parseMoney(prefs.getString('valor_$name'));
      }
    }
    t += _parseMoney(prefs.getString('valor_Gastos Fixos'));
    t += _parseMoney(prefs.getString('valor_Reserva'));
    return t;
  }

  static double _readSaldoAtual(SharedPreferences prefs) {
    final ativo = prefs.getBool('ativo_$kSaldoAtualPrefFieldName');
    if (ativo == false) return 0;
    return _parseMoney(prefs.getString('valor_$kSaldoAtualPrefFieldName'));
  }

  /// (Renda mensal − Gastos fixos + Saldo atual) / dias restantes no mês.
  static DailyLimitResult computeFromPrefs(SharedPreferences prefs) {
    final hoje = DateTime.now();
    final diasNoMes = DateTime(hoje.year, hoje.month + 1, 0).day;
    final diasRestantes = (diasNoMes - hoje.day + 1).clamp(1, 366);

    final rendaMensal = _sumIncome(prefs);
    final gastosFixosMensal = _sumExpenses(prefs);
    final saldoAtual = _readSaldoAtual(prefs);

    final raw =
        (rendaMensal - gastosFixosMensal + saldoAtual) / diasRestantes;

    if (raw <= 0) {
      final saldoFmt = _formatBrl(saldoAtual);
      return DailyLimitResult(
        displayLimit: 0,
        rawLimit: raw,
        showNonPositiveAlert: true,
        alertMessage:
            'Alerta: Você está com saldo negativo. Seu limite diário recomendado é R\$ 0,00 para evitar mais juros. Foque em cobrir o saldo de $saldoFmt.',
        diasRestantes: diasRestantes,
        saldoAtual: saldoAtual,
        rendaMensal: rendaMensal,
        gastosFixosMensal: gastosFixosMensal,
      );
    }

    return DailyLimitResult(
      displayLimit: raw,
      rawLimit: raw,
      showNonPositiveAlert: false,
      alertMessage: null,
      diasRestantes: diasRestantes,
      saldoAtual: saldoAtual,
      rendaMensal: rendaMensal,
      gastosFixosMensal: gastosFixosMensal,
    );
  }
}
