import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_routes.dart';
import '../../core/widgets/mentor_insight_card.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/risk_profile.dart';
import '../../services/localization_service.dart';
import '../../services/user_persona_service.dart';
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

  FinancialMarketRegion get _region =>
      LocalizationService.currentLocale.languageCode == 'pt'
          ? FinancialMarketRegion.brazil
          : FinancialMarketRegion.global;

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
    final region = _region;
    final v = context.mentorAdaptive;
    final tileFill = Theme.of(context).cardTheme.color ?? v.widgetColor;

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
              'Resumo do mercado',
              style: TextStyle(
                color: v.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              region == FinancialMarketRegion.brazil ? 'Foco B3 (BRL)' : 'Foco global (USD)',
              style: TextStyle(color: v.secondaryTextColor, fontSize: 13),
            ),
            const SizedBox(height: 12),
            MentorInsightCard(region: region, profile: RiskProfile.moderate),
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
