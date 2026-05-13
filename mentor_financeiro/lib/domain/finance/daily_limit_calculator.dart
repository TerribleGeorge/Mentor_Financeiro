import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Nomes dos campos de despesa em [FinanceConfigurationPage] (`valor_*` / `ativo_*`).
/// Manter alinhado à lista de campos da tela de configuração.
///
/// Ordem: moradia e obrigações legais → utilidades → vida corrente → outros fixos → poupança.
const List<String> kFinanceExpensePrefFieldNames = [
  'Aluguel',
  'Pensão',
  'Condomínio',
  'Financiamento (imóvel)',
  'IPTU (provisão mensal)',
  'Internet',
  'Luz',
  'Água / esgoto',
  'Gás',
  'Mercado',
  'Plano de saúde',
  'Educação (escola/curso)',
  'Academia',
  'Transporte',
  'Cartão',
  'Seguro',
  'Telefone / celular',
  'Assinaturas digitais',
  'Reserva Emergência',
];

const List<String> kFinanceIncomePrefFieldNames = ['Renda Fixa', 'Renda Extra'];

const String kSaldoAtualPrefFieldName = 'Saldo Atual';

/// Chave opcional em [SharedPreferences]: teto máximo para o **limite diário exibido**
/// (gastos variáveis por dia). `0` = sem teto (usa só a fórmula). Ausente = [kDefaultDailySpendCapBrl].
const String kDailySpendCapPrefKey = 'limite_diario_teto_brl';

/// Teto padrão quando o saldo na conta faz a fórmula explodir (guia “limite hoje”).
const double kDefaultDailySpendCapBrl = 50;

/// Sugestão de teto diário com base na configuração financeira guardada.
class DailySpendCapSuggestion {
  const DailySpendCapSuggestion({
    required this.id,
    required this.label,
    required this.rationale,
    required this.valueBrl,
    this.usesFormulaWithoutCap = false,
  });

  final String id;
  final String label;
  final String rationale;

  /// Valor a gravar em [kDailySpendCapPrefKey] (ignorado se [usesFormulaWithoutCap]).
  final double valueBrl;

  /// Se verdadeiro: o utilizador escolhe “sem teto” → gravar `0` na pref.
  final bool usesFormulaWithoutCap;
}

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
    this.limitWasCapped = false,
    this.infoMessage,
  });

  /// Limite exibido (nunca negativo). Pode ser o bruto da fórmula ou o [teto], o que for menor.
  final double displayLimit;

  /// Valor bruto da fórmula antes do teto e antes de truncar em zero para exibição.
  final double rawLimit;

  final bool showNonPositiveAlert;
  final String? alertMessage;
  final int diasRestantes;
  final double saldoAtual;
  final double rendaMensal;
  final double gastosFixosMensal;

  /// `true` quando [displayLimit] foi limitado pelo teto (não é a fórmula completa).
  final bool limitWasCapped;

  /// Mensagem neutra (ex.: explicar o teto), para não confundir com [alertMessage] de alerta.
  final String? infoMessage;
}

class DailyLimitCalculator {
  DailyLimitCalculator._();

  static double parseMoney(String? input) {
    final raw = input?.trim();
    if (raw == null || raw.isEmpty) return 0;

    var cleaned = raw.replaceAll(RegExp(r'[^\d,.\-]'), '');
    if (cleaned.isEmpty || cleaned == '-') return 0;

    final isNegative = cleaned.startsWith('-');
    cleaned = cleaned.replaceAll('-', '');

    final lastComma = cleaned.lastIndexOf(',');
    final lastDot = cleaned.lastIndexOf('.');
    final lastSeparator = lastComma > lastDot ? ',' : '.';
    final hasSeparator = lastComma >= 0 || lastDot >= 0;

    String normalized;
    if (hasSeparator) {
      final parts = cleaned.split(lastSeparator);
      final decimalPart = parts.length > 1 ? parts.last : '';
      final integerPart = parts
          .take(parts.length - 1)
          .join()
          .replaceAll(RegExp(r'[,.]'), '');

      if (decimalPart.length <= 2) {
        normalized = '$integerPart.$decimalPart';
      } else {
        normalized = cleaned.replaceAll(RegExp(r'[,.]'), '');
      }
    } else {
      normalized = cleaned;
    }

    final parsed = double.tryParse(normalized) ?? 0;
    return isNegative ? -parsed : parsed;
  }

  static String _formatBrl(double value) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(value);
  }

  /// Mesma regra da [FinanceConfigurationPage]: só entra no cálculo se o campo
  /// está marcado como ativo; se [ativo_*] nunca existiu (dados antigos), usa
  /// valor gravado não vazio.
  static bool fieldCountsTowardDailyLimit(
    SharedPreferences prefs,
    String name,
  ) {
    final ativo = prefs.getBool('ativo_$name');
    if (ativo != null) return ativo;
    final raw = prefs.getString('valor_$name');
    return raw != null && raw.trim().isNotEmpty;
  }

  static bool _fieldCounts(SharedPreferences prefs, String name) =>
      fieldCountsTowardDailyLimit(prefs, name);

  static double _sumIncome(SharedPreferences prefs) {
    var t = 0.0;
    for (final name in kFinanceIncomePrefFieldNames) {
      if (_fieldCounts(prefs, name)) {
        t += parseMoney(prefs.getString('valor_$name'));
      }
    }
    return t;
  }

  static double _sumExpenses(SharedPreferences prefs) {
    var t = 0.0;
    for (final name in kFinanceExpensePrefFieldNames) {
      if (_fieldCounts(prefs, name)) {
        t += parseMoney(prefs.getString('valor_$name'));
      }
    }
    t += parseMoney(prefs.getString('valor_Gastos Fixos'));
    t += parseMoney(prefs.getString('valor_Reserva'));
    return t;
  }

  static double _readSaldoAtual(SharedPreferences prefs) {
    final ativo = prefs.getBool('ativo_$kSaldoAtualPrefFieldName');
    if (ativo == false) return 0;
    return parseMoney(prefs.getString('valor_$kSaldoAtualPrefFieldName'));
  }

  /// Teto do limite diário exibido: [kDailySpendCapPrefKey] em prefs; `0` desliga o teto.
  static double? readDailySpendCapOrNull(SharedPreferences prefs) {
    if (!prefs.containsKey(kDailySpendCapPrefKey)) return null;
    final v = prefs.getDouble(kDailySpendCapPrefKey);
    if (v == null) return null;
    if (v <= 0) return 0;
    return v;
  }

  /// (Renda mensal − Gastos fixos + Saldo atual) / dias restantes no mês.
  /// O resultado é limitado por um **teto** (padrão [kDefaultDailySpendCapBrl]) para o caso
  /// de saldo alto inflar o “gasto por dia” de forma irrealista; o histórico continua a usar
  /// valores reais das transações — isto só afeta o **guia** “limite hoje”.
  static DailyLimitResult computeFromPrefs(SharedPreferences prefs) {
    final hoje = DateTime.now();
    final diasNoMes = DateTime(hoje.year, hoje.month + 1, 0).day;
    final diasRestantes = (diasNoMes - hoje.day + 1).clamp(1, 366);

    final rendaMensal = _sumIncome(prefs);
    final gastosFixosMensal = _sumExpenses(prefs);
    final saldoAtual = _readSaldoAtual(prefs);

    final raw = (rendaMensal - gastosFixosMensal + saldoAtual) / diasRestantes;

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
        limitWasCapped: false,
        infoMessage: null,
      );
    }

    final capPref = readDailySpendCapOrNull(prefs);
    final double? effectiveCap =
        capPref == null ? kDefaultDailySpendCapBrl : (capPref == 0 ? null : capPref);

    final capped = effectiveCap != null && raw > effectiveCap;
    final display = math.min(raw, effectiveCap ?? raw);

    final info = capped
        ? 'O limite calculado (${_formatBrl(raw)}) foi mostrado no teto de ${_formatBrl(display)} por dia (ajustável em Configurar finanças).'
        : null;

    return DailyLimitResult(
      displayLimit: display,
      rawLimit: raw,
      showNonPositiveAlert: false,
      alertMessage: null,
      diasRestantes: diasRestantes,
      saldoAtual: saldoAtual,
      rendaMensal: rendaMensal,
      gastosFixosMensal: gastosFixosMensal,
      limitWasCapped: capped,
      infoMessage: info,
    );
  }

  /// Sugestões de teto com base em renda, gastos fixos, saldo e dias restantes no mês.
  /// O utilizador escolhe uma opção em [FinanceConfigurationPage]; vazio na pref
  /// continua a usar [kDefaultDailySpendCapBrl] até gravar um valor.
  static List<DailySpendCapSuggestion> suggestDailySpendCaps(
    SharedPreferences prefs,
  ) {
    final hoje = DateTime.now();
    final diasNoMes = DateTime(hoje.year, hoje.month + 1, 0).day;
    final diasRestantes = (diasNoMes - hoje.day + 1).clamp(1, 366);
    final rendaMensal = _sumIncome(prefs);
    final gastosFixosMensal = _sumExpenses(prefs);
    final saldoAtual = _readSaldoAtual(prefs);
    final raw =
        (rendaMensal - gastosFixosMensal + saldoAtual) / diasRestantes.toDouble();

    double roundCap(double v) {
      if (v.isNaN || v <= 0) return 0;
      if (v < 10) return v.ceilToDouble();
      return (v / 5.0).round() * 5.0;
    }

    final out = <DailySpendCapSuggestion>[];

    bool hasValue(double v) => out.any(
          (e) =>
              !e.usesFormulaWithoutCap && (e.valueBrl - v).abs() < 0.01,
        );

    void add(DailySpendCapSuggestion s) {
      if (s.usesFormulaWithoutCap) {
        if (!out.any((e) => e.usesFormulaWithoutCap)) out.add(s);
        return;
      }
      if (s.valueBrl <= 0) return;
      if (hasValue(s.valueBrl)) return;
      out.add(s);
    }

    add(
      const DailySpendCapSuggestion(
        id: 'cap50',
        label: 'R\$ 50',
        rationale:
            'Controle forte no dia a dia — é o teto padrão do app se não escolheres outro.',
        valueBrl: 50,
      ),
    );

    if (raw > 0) {
      add(
        DailySpendCapSuggestion(
          id: 'tight',
          label: 'Contido',
          rationale:
              'Cerca de 30 % do guia diário calculado com os teus dados — favorece poupança.',
          valueBrl: roundCap(math.min(raw * 0.30, 200)),
        ),
      );
      add(
        DailySpendCapSuggestion(
          id: 'mid',
          label: 'Equilibrado',
          rationale:
              'Cerca de 50 % do guia — ritmo moderado conforme a tua configuração.',
          valueBrl: roundCap(math.min(raw * 0.50, 350)),
        ),
      );
      add(
        DailySpendCapSuggestion(
          id: 'loose',
          label: 'Com folga',
          rationale:
              'Cerca de 70 % do guia — mais espaço para imprevistos do dia.',
          valueBrl: roundCap(math.min(raw * 0.70, 600)),
        ),
      );
    }

    add(
      const DailySpendCapSuggestion(
        id: 'formula',
        label: 'Só a fórmula',
        rationale:
            'Sem teto manual: o ecrã usa o valor integral da fórmula (pode ser alto com saldo grande na conta).',
        valueBrl: 0,
        usesFormulaWithoutCap: true,
      ),
    );

    out.sort((a, b) {
      if (a.usesFormulaWithoutCap) return 1;
      if (b.usesFormulaWithoutCap) return -1;
      return a.valueBrl.compareTo(b.valueBrl);
    });
    return out;
  }
}
