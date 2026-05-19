import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../services/finance_config_signals.dart';
import '../services/locale_ui_strings.dart';
import '../services/localization_service.dart';
import '../services/transaction_refresh_signal.dart';
import '../theme/classic_mode_style.dart';

/// Limite diário de gastos (com base em prefs / [FinanceConfigurationPage]).
class HomeDailyLimitPanel extends StatefulWidget {
  const HomeDailyLimitPanel({super.key});

  @override
  State<HomeDailyLimitPanel> createState() => _HomeDailyLimitPanelState();
}

class _HomeDailyLimitPanelState extends State<HomeDailyLimitPanel> {
  double _limiteDiario = 0;
  double _gastosHoje = 0;
  double _porcentagem = 0;
  String? _alertaLimiteDiario;
  String? _infoLimiteDiario;
  DailyLimitResult? _limiteResultado;
  bool _loading = true;

  void _onFinanceConfigSaved() => _carregarDados();

  void _onTransacoesChanged() => _carregarDados();

  @override
  void initState() {
    super.initState();
    FinanceConfigSignals.addListener(_onFinanceConfigSaved);
    TransactionRefreshSignal.addListener(_onTransacoesChanged);
    _carregarDados();
  }

  @override
  void dispose() {
    FinanceConfigSignals.removeListener(_onFinanceConfigSaved);
    TransactionRefreshSignal.removeListener(_onTransacoesChanged);
    super.dispose();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    final limite = DailyLimitCalculator.computeFromPrefs(prefs);
    _limiteResultado = limite;
    _limiteDiario = limite.displayLimit;
    _alertaLimiteDiario = limite.alertMessage;
    _infoLimiteDiario = limite.infoMessage;

    final dataHoje = DateTime.now().toIso8601String().split('T')[0];
    _gastosHoje = prefs.getDouble('gastos_$dataHoje') ?? 0;
    _porcentagem = _limiteDiario > 0
        ? (_gastosHoje / _limiteDiario).clamp(0.0, 1.0)
        : 0;

    _loading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final strings = LocaleUiStrings.of(context);
    final result = _limiteResultado;

    if (_loading) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F16),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: scheme.primary.withValues(alpha: 0.35)),
        ),
        child: Center(
          child: SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: scheme.primary,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF000000), Color(0xFF07121B)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: scheme.primary.withValues(alpha: 0.75),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.16),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.text(
              'Limite Hoje',
              en: 'Today\'s limit',
              es: 'Límite de hoy',
            ),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.88),
              fontSize: 12,
              shadows: ClassicModeStyle.secondaryTextShadows(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            LocalizationService.formatCurrency(_limiteDiario),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ).withFinancialShadows(context),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: _porcentagem,
              backgroundColor: const Color(0xFF0D1118),
              valueColor: AlwaysStoppedAnimation(
                _porcentagem > 0.8
                    ? const Color(0xFFFC5C65)
                    : scheme.primary.withValues(alpha: 0.8),
              ),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _limiteDiario > 0
                ? strings.text(
                    '${LocalizationService.formatCurrency(_gastosHoje)} gastos de ${LocalizationService.formatCurrency(_limiteDiario)}',
                    en: '${LocalizationService.formatCurrency(_gastosHoje)} spent of ${LocalizationService.formatCurrency(_limiteDiario)}',
                    es: '${LocalizationService.formatCurrency(_gastosHoje)} gastados de ${LocalizationService.formatCurrency(_limiteDiario)}',
                  )
                : strings.text(
                    '${LocalizationService.formatCurrency(_gastosHoje)} gastos hoje (limite ${LocalizationService.formatCurrency(0)})',
                    en: '${LocalizationService.formatCurrency(_gastosHoje)} spent today (limit ${LocalizationService.formatCurrency(0)})',
                    es: '${LocalizationService.formatCurrency(_gastosHoje)} gastados hoy (límite ${LocalizationService.formatCurrency(0)})',
                  ),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.84),
              fontSize: 12,
            ).withFinancialShadows(context),
          ),
          if (_alertaLimiteDiario != null) ...[
            const SizedBox(height: 10),
            Text(
              result == null
                  ? _alertaLimiteDiario!
                  : strings.text(
                      'Alerta: Você está com saldo negativo. Seu limite diário recomendado é ${LocalizationService.formatCurrency(0)} para evitar mais juros. Foque em cobrir o saldo de ${LocalizationService.formatCurrency(result.saldoAtual)}.',
                      en: 'Alert: Your balance is negative. Your recommended daily limit is ${LocalizationService.formatCurrency(0)} to avoid more interest. Focus on covering the balance of ${LocalizationService.formatCurrency(result.saldoAtual)}.',
                      es: 'Alerta: tu saldo es negativo. Tu límite diario recomendado es ${LocalizationService.formatCurrency(0)} para evitar más intereses. Enfócate en cubrir el saldo de ${LocalizationService.formatCurrency(result.saldoAtual)}.',
                    ),
              style: TextStyle(
                color: const Color(0xFFFF6B6B),
                fontSize: 11,
                height: 1.35,
                fontWeight: FontWeight.w700,
                shadows: ClassicModeStyle.secondaryTextShadows(context),
              ),
            ),
          ],
          if (_infoLimiteDiario != null) ...[
            const SizedBox(height: 10),
            Text(
              result == null
                  ? _infoLimiteDiario!
                  : strings.text(
                      'O limite calculado (${LocalizationService.formatCurrency(result.rawLimit)}) foi mostrado no teto de ${LocalizationService.formatCurrency(result.displayLimit)} por dia (ajustável em Configurar finanças).',
                      en: 'The calculated limit (${LocalizationService.formatCurrency(result.rawLimit)}) was shown at the daily cap of ${LocalizationService.formatCurrency(result.displayLimit)} (adjustable in Configure finances).',
                      es: 'El límite calculado (${LocalizationService.formatCurrency(result.rawLimit)}) se mostró con el techo diario de ${LocalizationService.formatCurrency(result.displayLimit)} (ajustable en Configurar finanzas).',
                    ),
              style: TextStyle(
                color: Colors.cyanAccent.withValues(alpha: 0.85),
                fontSize: 11,
                height: 1.35,
                shadows: ClassicModeStyle.secondaryTextShadows(context),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
