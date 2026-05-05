import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_routes.dart';
import '../../core/widgets/mentor_insight_card.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/risk_profile.dart';
import '../../services/investment_category_provider.dart';
import '../../services/user_persona_service.dart';
import '../../widgets/patrimonio_convertido_card.dart';
import '../../theme/mentor_adaptive_visuals.dart';
import '../../tour/mentor_showcase_style.dart';
import '../../tour/mentor_tour_keys.dart';
import '../../widgets/mentor_readable_layer.dart';
import 'package:showcaseview/showcaseview.dart';

/// Painel principal: resumo de mercado + atalhos.
class MentorHomeScreen extends StatefulWidget {
  const MentorHomeScreen({super.key});

  @override
  State<MentorHomeScreen> createState() => _MentorHomeScreenState();
}

class _MentorHomeScreenState extends State<MentorHomeScreen> {
  bool _homeTourKickoffDone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeStartTourFromHome());
  }

  void _maybeStartTourFromHome() {
    if (_homeTourKickoffDone || !mounted) return;
    if (!context.read<UserPersonaService>().shouldShowTour) return;
    _homeTourKickoffDone = true;
    ShowcaseView.get().startShowCase(<GlobalKey>[MentorTourKeys.homeCalculadora]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cat = context.watch<InvestmentCategoryProvider>();
    final region = cat.isBrazilMarket
        ? FinancialMarketRegion.brazil
        : FinancialMarketRegion.global;
    final v = context.mentorAdaptive;
    final tileFill = Theme.of(context).cardTheme.color ?? v.widgetColor;

    Widget vitrineCard({
      required IconData icon,
      required Color accent,
      required String title,
      required String subtitle,
      required VoidCallback onTap,
    }) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: tileFill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accent.withValues(alpha: 0.35)),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: 0.12),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: v.textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: v.secondaryTextColor,
                        fontSize: 12,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: v.secondaryTextColor),
            ],
          ),
        ),
      );
    }

    final calculadoraTile = ListTile(
      tileColor: tileFill,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: const Icon(Icons.calculate, color: Color(0xFF00D9FF)),
      title: Text('Calculadora Mentora', style: TextStyle(color: v.textColor)),
      subtitle: Text(
        'Juros compostos, inflação e conselhos no seu perfil',
        style: TextStyle(color: v.secondaryTextColor, fontSize: 12),
      ),
      trailing: Icon(Icons.chevron_right, color: v.secondaryTextColor),
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.calculadoraMentora),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Mentor Financeiro',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.principal),
            child: const Text('Modo clássico', style: TextStyle(color: Color(0xFF00D9FF))),
          ),
        ],
      ),
      body: MentorReadableLayer(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              l10n.homeShowcaseTitle,
              style: TextStyle(
                color: v.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            vitrineCard(
              icon: Icons.psychology,
              accent: const Color(0xFF00D9FF),
              title: l10n.homeShowcaseProfileSimTitle,
              subtitle: l10n.homeShowcaseProfileSimSubtitle,
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.simulado),
            ),
            const SizedBox(height: 12),
            vitrineCard(
              icon: Icons.auto_graph,
              accent: const Color(0xFF6366F1),
              title: l10n.homeShowcaseStrategiesTitle,
              subtitle: l10n.homeShowcaseStrategiesSubtitle,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.conhecimentoEstrategias),
            ),
            const SizedBox(height: 12),
            vitrineCard(
              icon: Icons.hub,
              accent: const Color(0xFFE5E7EB),
              title: l10n.homeShowcaseMentorHubTitle,
              subtitle: l10n.homeShowcaseMentorHubSubtitle,
              onTap: () => showModalBottomSheet<void>(
                context: context,
                backgroundColor: tileFill,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                builder: (ctx) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.psychology, color: Color(0xFF00D9FF)),
                            title: Text(
                              l10n.homeShowcaseProfileSimTitle,
                              style: TextStyle(color: v.textColor),
                            ),
                            trailing: Icon(Icons.chevron_right, color: v.secondaryTextColor),
                            onTap: () {
                              Navigator.of(ctx).pop();
                              Navigator.of(context).pushNamed(AppRoutes.simulado);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.auto_graph, color: Color(0xFF6366F1)),
                            title: Text(
                              l10n.homeShowcaseStrategiesTitle,
                              style: TextStyle(color: v.textColor),
                            ),
                            trailing: Icon(Icons.chevron_right, color: v.secondaryTextColor),
                            onTap: () {
                              Navigator.of(ctx).pop();
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.conhecimentoEstrategias);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Resumo do mercado',
              style: TextStyle(
                color: v.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              region == FinancialMarketRegion.brazil
                  ? 'Mercado: Brasil (${cat.effectiveCountryCode}) · B3 / BRL'
                  : 'Mercado: internacional (${cat.effectiveCountryCode}) · cotações globais',
              style: TextStyle(color: v.secondaryTextColor, fontSize: 13),
            ),
            const SizedBox(height: 12),
            MentorInsightCard(region: region, profile: RiskProfile.moderate),
            const SizedBox(height: 16),
            const PatrimonioConvertidoCard(),
            const SizedBox(height: 28),
            Text(
              'Ferramentas',
              style: TextStyle(
                color: v.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            MentorShowcaseStyle.wrap(
              showcaseKey: MentorTourKeys.homeCalculadora,
              title: 'Tour Mentor',
              description:
                  'Abra a Calculadora Mentora para ver o gráfico de riqueza, gravar a simulação e personalizar o tom do Mentor.',
              child: calculadoraTile,
            ),
          ],
        ),
      ),
    );
  }
}
