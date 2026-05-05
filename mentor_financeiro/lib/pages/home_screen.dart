import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../core/constants/app_routes.dart';
import '../services/subscription_provider.dart';
import '../theme/classic_mode_style.dart';
import '../services/finance_config_signals.dart';
import 'adicionar_transacao_page.dart';
import 'paywall_screen.dart';
import 'tela_configuracao.dart';

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
  String? _photoUrl;
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
    final user = FirebaseAuth.instance.currentUser;
    _nomeUsuario =
        (user?.displayName?.trim().isNotEmpty == true
            ? user!.displayName!.trim()
            : (prefs.getString('nome_usuario') ?? 'Usuário'));
    _photoUrl =
        (user?.photoURL?.trim().isNotEmpty == true
            ? user!.photoURL!.trim()
            : (prefs.getString('photo_url')?.trim().isNotEmpty == true
                ? prefs.getString('photo_url')!.trim()
                : null));

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
    final subscription = context.watch<SubscriptionProvider>();
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
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: scheme.primary.withValues(alpha: 0.18),
                            foregroundImage: _photoUrl != null
                                ? NetworkImage(_photoUrl!)
                                : null,
                            child: _photoUrl == null
                                ? Icon(Icons.person, color: scheme.onSurface.withValues(alpha: 0.72))
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
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
                                const SizedBox(height: 2),
                                Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    color: scheme.onSurface,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    shadows: ClassicModeStyle.primaryTextShadows(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!subscription.isPremium)
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const PaywallScreen(),
                                ),
                              ),
                              child: const Text('Premium'),
                            ),
                        ],
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
                      Text(
                        'Recursos',
                        style: TextStyle(
                          color: scheme.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: ClassicModeStyle.primaryTextShadows(context),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureGrid(context, subscription),
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

  Widget _buildFeatureGrid(BuildContext context, SubscriptionProvider subscription) {
    Widget tile({
      required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap,
      bool premium = false,
    }) {
      final locked = premium && !subscription.isPremium;
      return InkWell(
        onTap: locked
            ? () => Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
                )
            : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.28)),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: color, size: 26),
                      const Spacer(),
                      if (locked) const Icon(Icons.lock, color: Colors.white54, size: 18),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      shadows: ClassicModeStyle.secondaryTextShadows(context),
                    ),
                  ),
                ],
              ),
              if (locked)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.35,
      children: [
        // FREE
        tile(
          icon: Icons.tune,
          label: 'Calculadora de Limite',
          color: const Color(0xFF00D9FF),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const TelaConfiguracao()),
          ),
        ),
        tile(
          icon: Icons.edit_note,
          label: 'Registro de Gastos',
          color: const Color(0xFF26DE81),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const AdicionarTransacaoPage()),
          ),
        ),
        tile(
          icon: Icons.flag,
          label: 'Simulador de Metas',
          color: const Color(0xFFFECA57),
          onTap: () => Navigator.pushNamed(context, AppRoutes.metas),
        ),
        tile(
          icon: Icons.menu_book,
          label: 'Conteúdo Educacional',
          color: const Color(0xFF6366F1),
          onTap: () => Navigator.pushNamed(context, AppRoutes.conhecimento),
        ),

        // PREMIUM (interceptor → paywall)
        tile(
          icon: Icons.psychology_alt,
          label: 'Mentoria',
          color: const Color(0xFFFF4D4D),
          premium: true,
          onTap: () => Navigator.pushNamed(context, AppRoutes.relatorios),
        ),
        tile(
          icon: Icons.query_stats,
          label: 'Análise Personalizada',
          color: const Color(0xFF00D9FF),
          premium: true,
          onTap: () => Navigator.pushNamed(context, AppRoutes.graficos),
        ),
        tile(
          icon: Icons.auto_graph,
          label: 'Estratégias Avançadas',
          color: const Color(0xFF6366F1),
          premium: true,
          onTap: () => Navigator.pushNamed(context, AppRoutes.conhecimentoEstrategias),
        ),
        tile(
          icon: Icons.picture_as_pdf,
          label: 'Relatórios',
          color: const Color(0xFFE5B100),
          premium: true,
          onTap: () => Navigator.pushNamed(context, AppRoutes.relatorios),
        ),
      ],
    );
  }
}
