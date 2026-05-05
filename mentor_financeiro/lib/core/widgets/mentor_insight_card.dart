import 'package:flutter/material.dart';

import '../../core/network/offline_exception.dart';
import '../../theme/mentor_adaptive_visuals.dart';
import '../../data/providers/financial_provider_factory.dart';
import '../../domain/entities/financial_market_region.dart';
import '../../domain/entities/mentor_allocation_hint.dart';
import '../../domain/entities/risk_profile.dart';
import '../../domain/mentorship/mentor_engine.dart';
import '../../l10n/app_localizations.dart';

/// Resumo de mercado com FutureBuilder e tratamento de erro leve.
class MentorInsightCard extends StatelessWidget {
  const MentorInsightCard({
    super.key,
    required this.region,
    this.profile = RiskProfile.moderate,
    this.symbols,
  });

  final FinancialMarketRegion region;
  final RiskProfile profile;
  final List<String>? symbols;

  List<String> get _effectiveSymbols {
    if (symbols != null && symbols!.isNotEmpty) {
      return symbols!;
    }
    return region == FinancialMarketRegion.brazil
        ? const ['PETR4', 'VALE3', 'ITUB4']
        : const ['AAPL', 'MSFT', 'VOO'];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final v = context.mentorAdaptive;
    final provider = FinancialProviderFactory.forRegion(region);
    const engine = MentorEngine();

    return Card(
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: provider.fetchQuotes(_effectiveSymbols),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Row(
                children: [
                  const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.mentorInsightLoading,
                      style: TextStyle(color: v.secondaryTextColor),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError || !snapshot.hasData) {
              final message = snapshot.error is OfflineException
                  ? l10n.mentorInsightOffline
                  : l10n.mentorInsightError;
              return Text(
                message,
                style: TextStyle(color: v.secondaryTextColor),
              );
            }

            final data = snapshot.data!;
            final suggestion = engine.suggest(
              profile: profile,
              region: region,
              snapshot: data,
            );

            final hintText = _hintLabel(l10n, suggestion.allocationHint);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.mentorInsightTitle,
                  style: TextStyle(
                    color: v.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  hintText,
                  style: TextStyle(color: v.secondaryTextColor, height: 1.35),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.mentorInsightSymbols(data.quotes.map((q) => q.symbol).join(', ')),
                  style: TextStyle(
                    color: v.secondaryTextColor.withValues(alpha: 0.85),
                    fontSize: 12,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _hintLabel(AppLocalizations l10n, MentorAllocationHint hint) {
    switch (hint) {
      case MentorAllocationHint.defensive:
        return l10n.mentorAllocationDefensive;
      case MentorAllocationHint.balanced:
        return l10n.mentorAllocationBalanced;
      case MentorAllocationHint.offensive:
        return l10n.mentorAllocationOffensive;
    }
  }
}
