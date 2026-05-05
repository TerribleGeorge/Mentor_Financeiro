import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../content/content_repository.dart';
import '../core/constants/app_routes.dart';
import '../core/widgets/mentor_insight_card.dart';
import '../domain/entities/financial_market_region.dart';
import '../domain/entities/risk_profile.dart';
import '../services/investment_category_provider.dart';

class TelaInvestimentos extends StatelessWidget {
  const TelaInvestimentos({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cat = context.watch<InvestmentCategoryProvider>();
    final isBrazilLocale =
        ContentRepository.isPtBrLocale(Localizations.localeOf(context));
    final topics = cat.educationCategories;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.adicionarInvestimento);
        },
        backgroundColor: const Color(0xFF00D9FF),
        foregroundColor: Colors.black87,
        icon: const Icon(Icons.add_chart),
        label: Text(l10n.investRegisterCta),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Text(
          l10n.investimentos,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            isBrazilLocale
                ? l10n.investRegionHintBr(cat.effectiveCountryCode)
                : l10n.investRegionHintGlobal(cat.effectiveCountryCode),
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 12),
          MentorInsightCard(
            region: cat.isBrazilMarket
                ? FinancialMarketRegion.brazil
                : FinancialMarketRegion.global,
            profile: RiskProfile.moderate,
          ),
          const SizedBox(height: 16),
          ...topics.map(
            (p) => _ExpansionTopico(
              icone: p.icon,
              titulo: p.title,
              descricao: p.description,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpansionTopico extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;

  const _ExpansionTopico({
    required this.icone,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        collapsedIconColor: const Color(0xFF00D9FF),
        iconColor: const Color(0xFF00D9FF),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF00D9FF).withAlpha(25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: const Color(0xFF00D9FF), size: 20),
        ),
        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        children: [
          Text(
            descricao,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
