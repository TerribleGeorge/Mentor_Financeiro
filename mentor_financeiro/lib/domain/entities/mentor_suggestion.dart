import 'financial_market_region.dart';
import 'mentor_allocation_hint.dart';
import 'risk_profile.dart';

class MentorSuggestion {
  final RiskProfile profileUsed;
  final FinancialMarketRegion region;
  final MentorAllocationHint allocationHint;
  final List<String> focusSymbols;
  final double volatilityScore;

  const MentorSuggestion({
    required this.profileUsed,
    required this.region,
    required this.allocationHint,
    required this.focusSymbols,
    required this.volatilityScore,
  });
}
