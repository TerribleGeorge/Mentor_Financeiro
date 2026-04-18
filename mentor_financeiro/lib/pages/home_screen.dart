import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _limiteDiario = 0;
  double _gastosHoje = 0;
  double _ganhosHoje = 0;
  double _porcentagem = 0;
  String _nomeUsuario = 'Usuário';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    _nomeUsuario = prefs.getString('nome_usuario') ?? 'Usuário';

    final hoje = DateTime.now();
    final diasNoMes = DateTime(hoje.year, hoje.month + 1, 0).day;
    final diasRestantes = diasNoMes - hoje.day + 1;

    double rendaFixa =
        double.tryParse(
          prefs.getString('valor_Renda Fixa')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;
    double rendaExtra =
        double.tryParse(
          prefs.getString('valor_Renda Extra')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;
    double gastosFixos =
        double.tryParse(
          prefs.getString('valor_Gastos Fixos')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;
    double reserva =
        double.tryParse(
          prefs.getString('valor_Reserva')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;

    double rendaMensal = rendaFixa + rendaExtra;
    double gastosMensal = gastosFixos + reserva;
    _limiteDiario = ((rendaMensal - gastosMensal) / diasRestantes);

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          ),
        ),
        child: SafeArea(
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
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Bem-vindo ao Mentor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00D9FF), Color(0xFF00A8CC)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF00D9FF,
                              ).withValues(alpha: 0.3),
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
                              ),
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
                              'R\$ ${_gastosHoje.toStringAsFixed(2)} gastos de R\$ ${_limiteDiario.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _buildQuickAction(
                              Icons.receipt_long,
                              'Transações',
                              const Color(0xFF00D9FF),
                              () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildQuickAction(
                              Icons.pie_chart,
                              'Gráficos',
                              const Color(0xFF26DE81),
                              () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildQuickAction(
                              Icons.history,
                              'Histórico',
                              const Color(0xFFFECA57),
                              () {},
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
      ),
    );
  }

  Widget _buildQuickAction(
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
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
