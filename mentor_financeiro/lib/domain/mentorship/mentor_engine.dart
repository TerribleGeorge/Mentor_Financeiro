import '../entities/financial_market_region.dart';
import '../entities/market_data_snapshot.dart';
import '../entities/mentor_allocation_hint.dart';
import '../entities/mentor_suggestion.dart';
import '../entities/risk_profile.dart';

/// Interpreta dados de mercado e devolve orientação educacional (sem persistência).
class MentorEngine {
  const MentorEngine();

  MentorSuggestion suggest({
    required RiskProfile profile,
    required FinancialMarketRegion region,
    required MarketDataSnapshot snapshot,
  }) {
    final volatility = _volatilityScore(snapshot);
    final hint = _allocationHint(profile: profile, volatility: volatility);

    final symbols = snapshot.quotes.map((q) => q.symbol).take(4).toList();

    return MentorSuggestion(
      profileUsed: profile,
      region: region,
      allocationHint: hint,
      focusSymbols: symbols,
      volatilityScore: volatility,
    );
  }

  double _volatilityScore(MarketDataSnapshot snapshot) {
    final deltas = snapshot.quotes
        .map((q) => q.changePercent?.abs())
        .whereType<double>()
        .toList();
    if (deltas.isEmpty) return 0.35;

    final mean = deltas.reduce((a, b) => a + b) / deltas.length;
    final capped = mean.clamp(0.0, 25.0) / 25.0;
    return capped;
  }

  MentorAllocationHint _allocationHint({
    required RiskProfile profile,
    required double volatility,
  }) {
    switch (profile) {
      case RiskProfile.conservative:
        return volatility > 0.55 ? MentorAllocationHint.defensive : MentorAllocationHint.balanced;
      case RiskProfile.moderate:
        if (volatility > 0.65) return MentorAllocationHint.defensive;
        if (volatility < 0.25) return MentorAllocationHint.balanced;
        return MentorAllocationHint.balanced;
      case RiskProfile.aggressive:
        return volatility > 0.7 ? MentorAllocationHint.balanced : MentorAllocationHint.offensive;
    }
  }
}
