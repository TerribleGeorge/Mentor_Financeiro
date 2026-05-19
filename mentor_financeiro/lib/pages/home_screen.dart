import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../widgets/home_daily_limit_panel.dart';
import '../core/constants/app_routes.dart';
import '../core/navigation/mentor_navigation.dart';
import '../services/subscription_provider.dart';
import '../services/mentoria_service.dart';
import '../services/ad_manager_service.dart';
import '../services/locale_ui_strings.dart';
import '../theme/classic_mode_style.dart';
import '../services/finance_config_signals.dart';
import 'adicionar_transacao_page.dart';
import 'paywall_screen.dart';
import 'settings_page.dart';
import 'finance_configuration_page.dart';
import '../widgets/ads/adaptive_banner_ad.dart';
import '../widgets/currency_rates_home_card.dart';
import '../widgets/investment_news_today_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _nomeUsuario = 'Usuário';
  String? _photoUrl;
  MentorLimitAlert? _mentorAlert;
  final ScrollController _scrollController = ScrollController();

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
    });
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
    _nomeUsuario = (user?.displayName?.trim().isNotEmpty == true
        ? user!.displayName!.trim()
        : (prefs.getString('nome_usuario') ?? 'Usuário'));
    _photoUrl = user?.photoURL?.trim().isNotEmpty == true
        ? user!.photoURL!.trim()
        : null;

    final limite = DailyLimitCalculator.computeFromPrefs(prefs);

    _mentorAlert = await MentoriaService.mentorLimitAlertFromPrefs(
      prefs: prefs,
      dailyLimit: limite.displayLimit,
    );

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final strings = LocaleUiStrings.of(context);
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
            tooltip: strings.settingsTitle,
            icon: Icon(Icons.settings_outlined, color: scheme.primary),
            onPressed: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(builder: (_) => const SettingsPage()),
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
                          backgroundColor: scheme.primary.withValues(
                            alpha: 0.18,
                          ),
                          foregroundImage: _photoUrl != null
                              ? NetworkImage(_photoUrl!)
                              : null,
                          child: _photoUrl == null
                              ? Icon(
                                  Icons.person,
                                  color: Colors.white.withValues(alpha: 0.85),
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                strings.text(
                                  'Olá, $_nomeUsuario',
                                  en: 'Hello, $_nomeUsuario',
                                  es: 'Hola, $_nomeUsuario',
                                ),
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.88),
                                  fontSize: 14,
                                  shadows:
                                      ClassicModeStyle.secondaryTextShadows(
                                        context,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                strings.text(
                                  'Dashboard',
                                  en: 'Dashboard',
                                  es: 'Panel',
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  shadows: ClassicModeStyle.primaryTextShadows(
                                    context,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!subscription.isPremium)
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => const PaywallScreen(),
                              ),
                            ),
                            child: const Text(
                              'Premium',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                      ],
                    ),
                    StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, authSnap) {
                        if (authSnap.data != null) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: scheme.primary.withValues(alpha: 0.45),
                              ),
                              color: scheme.primary.withValues(alpha: 0.12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.cloud_off_outlined,
                                    color: scheme.primary,
                                    size: 26,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      strings.text(
                                        'Sem sessão na nuvem. Inicie sessão para guardar o perfil e sincronizar entre dispositivos.',
                                        en: 'No cloud session. Sign in to save your profile and sync across devices.',
                                        es: 'Sin sesión en la nube. Inicia sesión para guardar tu perfil y sincronizar entre dispositivos.',
                                      ),
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.9,
                                        ),
                                        fontSize: 13,
                                        height: 1.35,
                                        shadows:
                                            ClassicModeStyle.secondaryTextShadows(
                                              context,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  FilledButton.tonal(
                                    onPressed: () => mentorPushNamed(
                                      context,
                                      AppRoutes.login,
                                    ),
                                    child: Text(
                                      strings.text(
                                        'Entrar',
                                        en: 'Sign in',
                                        es: 'Entrar',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    if (_mentorAlert != null) ...[
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(
                              0xFFFF2D2D,
                            ).withValues(alpha: 0.45),
                          ),
                          color: const Color(
                            0xFFFF2D2D,
                          ).withValues(alpha: 0.08),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.warning_amber,
                              color: Color(0xFFFF2D2D),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _mentorAlert!.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      shadows:
                                          ClassicModeStyle.primaryTextShadows(
                                            context,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _mentorAlert!.message,
                                    style: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.88,
                                      ),
                                      height: 1.25,
                                      shadows:
                                          ClassicModeStyle.secondaryTextShadows(
                                            context,
                                          ),
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
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    const HomeDailyLimitPanel(),
                    const SizedBox(height: 16),
                    const InvestmentNewsTodayCard(),
                    const SizedBox(height: 16),
                    const CurrencyRatesHomeCard(),
                    const SizedBox(height: 24),
                    Text(
                      strings.text('Recursos', en: 'Features', es: 'Recursos'),
                      style: TextStyle(
                        color: Colors.white,
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
                            Icons.pie_chart,
                            strings.navCharts,
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
                            strings.navHistory,
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
                      height:
                          MediaQuery.paddingOf(context).bottom +
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

  /// Rótulo de secção para a grelha de atalhos da home (modo clássico).
  Widget _homeFeatureSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.72),
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        shadows: ClassicModeStyle.secondaryTextShadows(context),
      ),
    );
  }

  Widget _buildFeatureGrid(
    BuildContext context,
    SubscriptionProvider subscription,
  ) {
    Widget tile({
      required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap,
      bool premium = false,

      /// Quando true, o card estica à célula (ex.: linha Premium com [Expanded]).
      bool expand = false,
    }) {
      final locked = premium && !subscription.isPremium;
      final card = Container(
        width: expand ? double.infinity : null,
        height: expand ? double.infinity : null,
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
                    if (locked)
                      const Icon(Icons.lock, color: Colors.white54, size: 18),
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
      );

      return InkWell(
        onTap: locked
            ? () => Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
              )
            : onTap,
        borderRadius: BorderRadius.circular(16),
        child: card,
      );
    }

    /// Grelha 2×2 (4 cards): sem buracos; altura derivada de [childAspectRatio].
    Widget featureGrid2x2(List<Widget> tiles) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.35,
        children: tiles,
      );
    }

    /// Uma linha com 3 cards à mesma largura (evita o “buraco” da grelha 2 colunas).
    Widget premiumRow3(List<Widget> tiles, double maxWidth) {
      assert(tiles.length == 3);
      final gap = 12.0;
      // Mesma altura visual que uma célula da grelha 2×2 em cima.
      final cellW2 = (maxWidth - gap) / 2;
      final rowHeight = cellW2 / 1.35;

      return SizedBox(
        height: rowHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: tiles[0]),
            SizedBox(width: gap),
            Expanded(child: tiles[1]),
            SizedBox(width: gap),
            Expanded(child: tiles[2]),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _homeFeatureSectionTitle(
              context,
              LocaleUiStrings.of(context).text(
                'Organização e registo',
                en: 'Organization and records',
                es: 'Organización y registro',
              ),
            ),
            const SizedBox(height: 10),
            featureGrid2x2(<Widget>[
              tile(
                icon: Icons.tune,
                label: LocaleUiStrings.of(context).text(
                  'Renda e Gastos Fixos',
                  en: 'Income and Fixed Expenses',
                  es: 'Ingresos y gastos fijos',
                ),
                color: const Color(0xFF00D9FF),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const FinanceConfigurationPage(),
                  ),
                ),
              ),
              tile(
                icon: Icons.edit_note,
                label: LocaleUiStrings.of(context).text(
                  'Registro de Gastos',
                  en: 'Expense Entry',
                  es: 'Registro de gastos',
                ),
                color: const Color(0xFF26DE81),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const AdicionarTransacaoPage(),
                  ),
                ),
              ),
              tile(
                icon: Icons.flag,
                label: LocaleUiStrings.of(context).text(
                  'Simulador de Metas',
                  en: 'Goals Simulator',
                  es: 'Simulador de metas',
                ),
                color: const Color(0xFFFECA57),
                onTap: () => mentorPushNamed(context, AppRoutes.metas),
              ),
              tile(
                icon: Icons.menu_book,
                label: LocaleUiStrings.of(context).text(
                  'Conteúdo Educacional',
                  en: 'Educational Content',
                  es: 'Contenido educativo',
                ),
                color: const Color(0xFF6366F1),
                onTap: () => mentorPushNamed(context, AppRoutes.conhecimento),
              ),
            ]),
            const SizedBox(height: 22),
            _homeFeatureSectionTitle(context, 'Mentor Premium'),
            const SizedBox(height: 10),
            premiumRow3(<Widget>[
              tile(
                icon: Icons.psychology_alt,
                label: LocaleUiStrings.of(
                  context,
                ).text('Mentoria', en: 'Mentoring', es: 'Mentoría'),
                color: const Color(0xFFFF4D4D),
                premium: true,
                expand: true,
                onTap: () => mentorPushNamed(context, AppRoutes.mentoria),
              ),
              tile(
                icon: Icons.query_stats,
                label: LocaleUiStrings.of(context).text(
                  'Análise Personalizada',
                  en: 'Personalized Analysis',
                  es: 'Análisis personalizado',
                ),
                color: const Color(0xFF00D9FF),
                premium: true,
                expand: true,
                onTap: () => mentorPushNamed(
                  context,
                  AppRoutes.relatorios,
                  arguments: LocaleUiStrings.of(context).text(
                    'Análise Personalizada',
                    en: 'Personalized Analysis',
                    es: 'Análisis personalizado',
                  ),
                ),
              ),
              tile(
                icon: Icons.auto_graph,
                label: LocaleUiStrings.of(context).text(
                  'Estratégias Avançadas',
                  en: 'Advanced Strategies',
                  es: 'Estrategias avanzadas',
                ),
                color: const Color(0xFF6366F1),
                premium: true,
                expand: true,
                onTap: () =>
                    mentorPushNamed(context, AppRoutes.conhecimentoEstrategias),
              ),
            ], w),
          ],
        );
      },
    );
  }
}
