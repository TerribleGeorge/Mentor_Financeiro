import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/persona_visual_theme.dart';
import '../../domain/entities/user_persona.dart';
import '../../l10n/app_localizations.dart';
import '../../services/localization_service.dart';
import '../../services/user_persona_service.dart';
import 'insight_detail_args.dart';

/// Análise detalhada da simulação, com tom reativo ao [UserPersona].
class InsightDetailScreen extends StatelessWidget {
  const InsightDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final raw = ModalRoute.of(context)?.settings.arguments;
    final args = raw is InsightDetailArgs ? raw : null;
    final l10n = AppLocalizations.of(context)!;

    if (args == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.compoundMentorCardTitle)),
        body: Center(child: Text(l10n.compoundInvalidInput)),
      );
    }

    final persona = context.watch<UserPersonaService>().persona;
    final visual = PersonaVisualTheme.forPersona(persona);
    final r = args.result;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          l10n.compoundMentorCardTitle,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _chipPersona(context, l10n, persona, visual),
          const SizedBox(height: 16),
          _metricCard(
            visual,
            l10n.compoundSummaryNominalEnd,
            LocalizationService.formatCurrency(r.nominalFutureValue),
          ),
          const SizedBox(height: 10),
          _metricCard(
            visual,
            l10n.compoundSummaryRealGain,
            LocalizationService.formatCurrency(r.realGain),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.compoundMentorCardTitle,
            style: TextStyle(
              color: visual.accent,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          ...args.advice.map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.auto_awesome, size: 20, color: visual.insightIconColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      t,
                      style: const TextStyle(color: Colors.white70, height: 1.45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chipPersona(
    BuildContext context,
    AppLocalizations l10n,
    UserPersona p,
    PersonaVisualTheme visual,
  ) {
    final label = switch (p) {
      UserPersona.novice => l10n.userPersonaNovice,
      UserPersona.strategist => l10n.userPersonaStrategist,
      UserPersona.riskTaker => l10n.userPersonaRiskTaker,
      UserPersona.conservative => l10n.userPersonaConservative,
    };
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        backgroundColor: visual.accent.withValues(alpha: 0.2),
        label: Text(
          '${l10n.userPersonaSectionTitle}: $label',
          style: TextStyle(color: visual.accent, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _metricCard(PersonaVisualTheme visual, String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: visual.mentorBorder.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
