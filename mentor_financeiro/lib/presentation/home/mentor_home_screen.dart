import 'package:flutter/material.dart';

import '../../core/constants/app_routes.dart';
import '../../core/widgets/mentor_insight_card.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/risk_profile.dart';
import '../../services/localization_service.dart';

/// Painel principal: resumo de mercado + atalhos.
class MentorHomeScreen extends StatelessWidget {
  const MentorHomeScreen({super.key});

  FinancialMarketRegion get _region =>
      LocalizationService.currentLocale.languageCode == 'pt'
          ? FinancialMarketRegion.brazil
          : FinancialMarketRegion.global;

  @override
  Widget build(BuildContext context) {
    final region = _region;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Resumo do mercado',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            region == FinancialMarketRegion.brazil ? 'Foco B3 (BRL)' : 'Foco global (USD)',
            style: const TextStyle(color: Colors.white54, fontSize: 13),
          ),
          const SizedBox(height: 12),
          MentorInsightCard(region: region, profile: RiskProfile.moderate),
          const SizedBox(height: 28),
          const Text(
            'Ferramentas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            tileColor: const Color(0xFF1E293B),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            leading: const Icon(Icons.calculate, color: Color(0xFF00D9FF)),
            title: const Text('Calculadora Mentora', style: TextStyle(color: Colors.white)),
            subtitle: const Text(
              'Juros compostos, inflação e conselhos no seu perfil',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.white38),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.calculadoraMentora),
          ),
        ],
      ),
    );
  }
}
