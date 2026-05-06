import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../core/constants/app_routes.dart';
import '../core/navigation/mentor_navigation.dart';
import '../services/flutter_notification_interceptor.dart';
import '../services/subscription_provider.dart';
import '../services/mentoria_service.dart';
import '../services/ad_manager_service.dart';
import '../theme/classic_mode_style.dart';
import '../services/finance_config_signals.dart';
import 'adicionar_transacao_page.dart';
import 'paywall_screen.dart';
import 'settings_page.dart';
import 'finance_configuration_page.dart';
import '../widgets/ads/adaptive_banner_ad.dart';

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
  MentorLimitAlert? _mentorAlert;
  final ScrollController _scrollController = ScrollController();

  final Map<String, TextEditingController> _budgetControllers = {
    'Renda Fixa': TextEditingController(),
    'Renda Extra': TextEditingController(),
    'Aluguel': TextEditingController(),
    'Internet': TextEditingController(),
    'Luz': TextEditingController(),
    'Mercado': TextEditingController(),
    'Transporte': TextEditingController(),
    'Cartão': TextEditingController(),
  };

  bool _budgetLoading = true;

  void _onFinanceConfigSaved() => _carregarDados();

  @override
  void initState() {
    super.initState();
    FinanceConfigSignals.addListener(_onFinanceConfigSaved);
    _carregarDados();
    // Preload interstitial for "pause moments" (free only; service handles gating).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sub = context.read<SubscriptionProvider>();
      if (!sub.isPremium) {
        // fire-and-forget
        AdManagerService.instance.preloadInterstitial(sub);
      }
      if (Platform.isAndroid) {
        FlutterNotificationInterceptor.tryStartServiceIfPermitted();
      }
    });
  }

  @override
  void dispose() {
    FinanceConfigSignals.removeListener(_onFinanceConfigSaved);
    _scrollController.dispose();
    for (final c in _budgetControllers.values) {
      c.dispose();
    }
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

    _mentorAlert = await MentoriaService.mentorLimitAlertFromPrefs(
      prefs: prefs,
      dailyLimit: _limiteDiario,
    );

    await _loadInlineBudget(prefs);

    if (mounted) setState(() {});
  }

  Future<void> _loadInlineBudget(SharedPreferences prefs) async {
    for (final entry in _budgetControllers.entries) {
      entry.value.text = prefs.getString('valor_${entry.key}') ?? '';
    }
    _budgetLoading = false;
  }

  double _parseMoney(String raw) {
    final v = raw.trim().replaceAll(',', '.');
    return double.tryParse(v) ?? 0;
  }

  Future<void> _saveInlineBudget() async {
    final prefs = await SharedPreferences.getInstance();
    for (final entry in _budgetControllers.entries) {
      await prefs.setString('valor_${entry.key}', entry.value.text.trim());
      await prefs.setBool('ativo_${entry.key}', true);
    }
    await prefs.setBool('configurado', true);
    FinanceConfigSignals.notifySaved();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Renda e gastos fixos guardados.')),
    );
  }

  Widget _inlineBudgetCard(ColorScheme scheme) {
    if (_budgetLoading) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F16),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: scheme.primary.withValues(alpha: 0.35)),
        ),
        child: const Center(
          child: SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    final renda = _parseMoney(_budgetControllers['Renda Fixa']!.text) +
        _parseMoney(_budgetControllers['Renda Extra']!.text);
    final gastos = _parseMoney(_budgetControllers['Aluguel']!.text) +
        _parseMoney(_budgetControllers['Internet']!.text) +
        _parseMoney(_budgetControllers['Luz']!.text) +
        _parseMoney(_budgetControllers['Mercado']!.text) +
        _parseMoney(_budgetControllers['Transporte']!.text) +
        _parseMoney(_budgetControllers['Cartão']!.text);

    InputDecoration deco(String label) => InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: scheme.onSurface.withValues(alpha: 0.6)),
          filled: true,
          fillColor: const Color(0xFF0D1118),
          prefixText: 'R\$ ',
          prefixStyle: TextStyle(color: scheme.primary.withValues(alpha: 0.85)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: scheme.primary.withValues(alpha: 0.22)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: scheme.primary.withValues(alpha: 0.22)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: scheme.primary.withValues(alpha: 0.55)),
          ),
        );

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
        border: Border.all(color: scheme.primary.withValues(alpha: 0.75), width: 1.2),
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
          Row(
            children: [
              Icon(Icons.tune, color: scheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Renda e Gastos Fixos',
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    shadows: ClassicModeStyle.primaryTextShadows(context),
                  ),
                ),
              ),
              TextButton(
                onPressed: _saveInlineBudget,
                child: const Text('Guardar'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Renda: R\$ ${renda.toStringAsFixed(2)} · Gastos: R\$ ${gastos.toStringAsFixed(2)}',
            style: TextStyle(
              color: scheme.onSurface.withValues(alpha: 0.62),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _budgetControllers['Renda Fixa'],
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: scheme.onSurface),
                  decoration: deco('Renda Fixa'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _budgetControllers['Renda Extra'],
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: scheme.onSurface),
                  decoration: deco('Renda Extra'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _budgetSmallField(scheme, 'Aluguel', deco),
              _budgetSmallField(scheme, 'Internet', deco),
              _budgetSmallField(scheme, 'Luz', deco),
              _budgetSmallField(scheme, 'Mercado', deco),
              _budgetSmallField(scheme, 'Transporte', deco),
              _budgetSmallField(scheme, 'Cartão', deco),
            ],
          ),
        ],
      ),
    );
  }

  Widget _budgetSmallField(
    ColorScheme scheme,
    String key,
    InputDecoration Function(String) deco,
  ) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 20 * 2 - 12) / 2,
      child: TextField(
        controller: _budgetControllers[key],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(color: scheme.onSurface),
        decoration: deco(key),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final subscription = context.watch<SubscriptionProvider>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: 'Definições',
            icon: Icon(
              Icons.settings_outlined,
              color: scheme.primary,
            ),
            onPressed: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
          top: false,
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
                      if (_mentorAlert != null) ...[
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFFF2D2D).withValues(alpha: 0.45),
                            ),
                            color: const Color(0xFFFF2D2D).withValues(alpha: 0.08),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.warning_amber, color: Color(0xFFFF2D2D)),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _mentorAlert!.title,
                                      style: TextStyle(
                                        color: scheme.onSurface,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _mentorAlert!.message,
                                      style: TextStyle(
                                        color: scheme.onSurface.withValues(alpha: 0.75),
                                        height: 1.25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () =>
                                    mentorPushNamed(context, AppRoutes.mentoria),
                                icon: const Icon(Icons.chevron_right),
                                color: scheme.onSurface.withValues(alpha: 0.75),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF000000),
                              const Color(0xFF07121B),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: scheme.primary.withValues(alpha: 0.18),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          border: Border.all(
                            color: scheme.primary.withValues(alpha: 0.55),
                            width: 1.2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Limite Hoje',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 12,
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
                              style: const TextStyle(
                                color: Color(0xFF94A3B8),
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
                      _inlineBudgetCard(scheme),
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
                                mentorPushNamed(context, AppRoutes.historico);
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
                                mentorPushNamed(context, AppRoutes.graficos);
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
                                mentorPushNamed(context, AppRoutes.historico);
                              },
                            ),
                          ),
                        ],
                      ),
                      // Banner no fim da Home (fora da árvore se Premium).
                      const SizedBox(height: 16),
                      if (!subscription.isPremium) const AdaptiveBannerAd(),
                      SizedBox(
                        height: MediaQuery.paddingOf(context).bottom +
                            kBottomNavigationBarHeight,
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
          color: const Color(0xFF0D1118),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.75), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.14),
              blurRadius: 18,
              spreadRadius: 1,
            ),
          ],
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
            color: const Color(0xFF0D1118),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.78), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.14),
                blurRadius: 18,
                spreadRadius: 1,
              ),
            ],
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
          label: 'Renda e Gastos Fixos',
          color: const Color(0xFF00D9FF),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const FinanceConfigurationPage()),
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
          onTap: () => mentorPushNamed(context, AppRoutes.metas),
        ),
        tile(
          icon: Icons.menu_book,
          label: 'Conteúdo Educacional',
          color: const Color(0xFF6366F1),
          onTap: () => mentorPushNamed(context, AppRoutes.conhecimento),
        ),

        // PREMIUM (interceptor → paywall)
        tile(
          icon: Icons.psychology_alt,
          label: 'Mentoria',
          color: const Color(0xFFFF4D4D),
          premium: true,
          onTap: () => mentorPushNamed(context, AppRoutes.mentoria),
        ),
        tile(
          icon: Icons.query_stats,
          label: 'Análise Personalizada',
          color: const Color(0xFF00D9FF),
          premium: true,
          onTap: () => mentorPushNamed(context, AppRoutes.relatorios),
        ),
        tile(
          icon: Icons.auto_graph,
          label: 'Estratégias Avançadas',
          color: const Color(0xFF6366F1),
          premium: true,
          onTap: () =>
              mentorPushNamed(context, AppRoutes.conhecimentoEstrategias),
        ),
        tile(
          icon: Icons.picture_as_pdf,
          label: 'Relatórios',
          color: const Color(0xFFE5B100),
          premium: true,
          onTap: () => mentorPushNamed(context, AppRoutes.relatorios),
        ),
      ],
    );
  }
}
