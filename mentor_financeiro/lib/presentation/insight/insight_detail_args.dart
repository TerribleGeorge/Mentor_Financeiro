import '../../domain/entities/compound_interest_result.dart';

/// Argumentos para [InsightDetailScreen] (via [RouteSettings.arguments]).
class InsightDetailArgs {
  const InsightDetailArgs({
    required this.result,
    required this.advice,
  });

  final CompoundInterestResult result;
  final List<String> advice;
}
