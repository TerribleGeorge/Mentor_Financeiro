import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../services/finance_config_signals.dart';
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
  bool _loading = true;

  void _onFinanceConfigSaved() => _carregarDados();

  @override
  void initState() {
    super.initState();
    FinanceConfigSignals.addListener(_onFinanceConfigSaved);
    _carregarDados();
  }

  @override
  void dispose() {
    FinanceConfigSignals.removeListener(_onFinanceConfigSaved);
    super.dispose();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    final limite = DailyLimitCalculator.computeFromPrefs(prefs);
    _limiteDiario = limite.displayLimit;
    _alertaLimiteDiario = limite.alertMessage;

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
          colors: [
            Color(0xFF000000),
            Color(0xFF07121B),
          ],
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
            'Limite Hoje',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.88),
              fontSize: 12,
              shadows: ClassicModeStyle.secondaryTextShadows(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'R\$ ${_limiteDiario.toStringAsFixed(2)}',
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
                ? 'R\$ ${_gastosHoje.toStringAsFixed(2)} gastos de R\$ ${_limiteDiario.toStringAsFixed(2)}'
                : 'R\$ ${_gastosHoje.toStringAsFixed(2)} gastos hoje (limite R\$ 0,00)',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.84),
              fontSize: 12,
            ).withFinancialShadows(context),
          ),
          if (_alertaLimiteDiario != null) ...[
            const SizedBox(height: 10),
            Text(
              _alertaLimiteDiario!,
              style: TextStyle(
                color: const Color(0xFFFF6B6B),
                fontSize: 11,
                height: 1.35,
                fontWeight: FontWeight.w700,
                shadows: ClassicModeStyle.secondaryTextShadows(context),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
