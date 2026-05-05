import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../theme/classic_mode_style.dart';
import '../services/finance_config_signals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _limiteDiario = 0;
  double _gastosHoje = 0;
  // ignore: unused_field - Reservado para uso futuro (exibir ganhos do dia)
  double _ganhosHoje = 0;
  double _porcentagem = 0;
  String? _alertaLimiteDiario;
  String _nomeUsuario = 'Usuário';
  final ScrollController _scrollController = ScrollController();

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
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    _nomeUsuario = prefs.getString('nome_usuario') ?? 'Usuário';

    final limite = DailyLimitCalculator.computeFromPrefs(prefs);
    _limiteDiario = limite.displayLimit;
    _alertaLimiteDiario = limite.alertMessage;

    final dataHoje = DateTime.now().toIso8601String().split('T')[0];
    _gastosHoje = prefs.getDouble('gastos_$dataHoje') ?? 0;
    _ganhosHoje = prefs.getDouble('ganhos_$dataHoje') ?? 0;
    _porcentagem = _limiteDiario > 0
        ? (_gastosHoje / _limiteDiario).clamp(0.0, 1.0)
        : 0;

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá, $_nomeUsuario',
                        style: TextStyle(
                          color: scheme.onSurface.withValues(alpha: 0.72),
                          fontSize: 14,
                          shadows: ClassicModeStyle.secondaryTextShadows(context),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Bem-vindo ao Mentor',
                        style: TextStyle(
                          color: scheme.onSurface,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: ClassicModeStyle.primaryTextShadows(context),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              scheme.primary,
                              scheme.primary.withValues(alpha: 0.82),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: scheme.primary.withValues(alpha: 0.28),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Limite Hoje',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'R\$ ${_limiteDiario.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ).withFinancialShadows(context),
                            ),
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: _porcentagem,
                                backgroundColor: Colors.black12,
                                valueColor: AlwaysStoppedAnimation(
                                  _porcentagem > 0.8
                                      ? const Color(0xFFFC5C65)
                                      : Colors.black54,
                                ),
                                minHeight: 8,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _limiteDiario > 0
                                  ? 'R\$ ${_gastosHoje.toStringAsFixed(2)} gastos de R\$ ${_limiteDiario.toStringAsFixed(2)}'
                                  : 'R\$ ${_gastosHoje.toStringAsFixed(2)} gastos hoje (limite R\$ 0,00)',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ).withFinancialShadows(context),
                            ),
                            if (_alertaLimiteDiario != null) ...[
                              const SizedBox(height: 10),
                              Text(
                                _alertaLimiteDiario!,
                                style: const TextStyle(
                                  color: Color(0xFF991B1B),
                                  fontSize: 11,
                                  height: 1.35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _buildQuickAction(
                              context,
                              Icons.receipt_long,
                              'Transações',
                              const Color(0xFF00D9FF),
                              () {
                                Navigator.pushNamed(
                                  context,
                                  '/principal',
                                  arguments: 2,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildQuickAction(
                              context,
                              Icons.pie_chart,
                              'Gráficos',
                              const Color(0xFF26DE81),
                              () {
                                Navigator.pushNamed(
                                  context,
                                  '/principal',
                                  arguments: 1,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildQuickAction(
                              context,
                              Icons.history,
                              'Histórico',
                              const Color(0xFFFECA57),
                              () {
                                Navigator.pushNamed(
                                  context,
                                  '/principal',
                                  arguments: 2,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                shadows: ClassicModeStyle.secondaryTextShadows(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
