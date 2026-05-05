import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/finance/daily_limit_calculator.dart';
import '../theme/classic_mode_style.dart';
import '../theme/mentor_adaptive_visuals.dart';
import '../services/finance_config_signals.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  double _limiteDiario = 0;
  double _gastosHoje = 0;
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

  void _abrirSimulado() {
    Navigator.pushNamed(context, '/simulado');
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

  Widget _botaoNavegacao(IconData icone, String rota) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, rota),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.mentorAdaptive.widgetColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: context.mentorAdaptive.textColor.withValues(alpha: 0.1),
              ),
            ),
            child: Icon(icone, color: Colors.white54),
          ),
        ),
      ),
    );
  }

  String _gerarSaudacao() {
    final hora = DateTime.now().hour;
    if (hora < 12) return 'Bom dia!';
    if (hora < 18) return 'Boa tarde!';
    return 'Boa noite!';
  }

  Color _corLimite() {
    if (_porcentagem < 0.5) return Colors.green;
    if (_porcentagem < 0.8) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _gerarSaudacao(),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _nomeUsuario,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _botaoNavegacao(Icons.person, '/perfil'),
                        const SizedBox(width: 8),
                        _botaoNavegacao(Icons.flag, '/metas'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            _corLimite().withAlpha(36),
                            _corLimite().withAlpha(12),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _corLimite().withAlpha(70),
                          width: 1,
                        ),
                      ),
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LIMITE HOJE",
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "R\$ ${_limiteDiario.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ).withFinancialShadows(context),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: _porcentagem,
                          backgroundColor: Colors.white12,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _corLimite(),
                          ),
                          minHeight: 6,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _limiteDiario > 0
                            ? "${(_porcentagem * 100).toStringAsFixed(0)}% usado"
                            : "Sem limite diário positivo",
                        style: TextStyle(color: _corLimite(), fontSize: 12),
                      ),
                      if (_alertaLimiteDiario != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          _alertaLimiteDiario!,
                          style: TextStyle(
                            color: Colors.amber.shade200,
                            fontSize: 12,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ],
                  ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.mentorAdaptive.widgetColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: context.mentorAdaptive.textColor
                                    .withValues(alpha: 0.1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "GASTOS",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "R\$ ${_gastosHoje.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ).withFinancialShadows(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.mentorAdaptive.widgetColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: context.mentorAdaptive.textColor
                                    .withValues(alpha: 0.1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "RECEBIDO",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "R\$ ${_ganhosHoje.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ).withFinancialShadows(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/conhecimento'),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D9FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, color: Color(0xFF0F172A)),
                        SizedBox(width: 12),
                        Text(
                          "Explorar Conhecimento",
                          style: TextStyle(
                            color: Color(0xFF0F172A),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: _abrirSimulado,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF00D9FF).withAlpha(40),
                          const Color(0xFF00D9FF).withAlpha(15),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFF00D9FF).withAlpha(128),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.psychology, color: Color(0xFF00D9FF)),
                        SizedBox(width: 12),
                        Text(
                          "Descobrir meu Perfil",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/conhecimento'),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.indigo.withAlpha(75)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, color: Colors.indigo),
                        SizedBox(width: 12),
                        Text(
                          "Conhecimento Financeiro",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
