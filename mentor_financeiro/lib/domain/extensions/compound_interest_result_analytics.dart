import 'dart:math';

import '../entities/compound_interest_result.dart';

extension CompoundInterestResultAnalytics on CompoundInterestResult {
  double get approximateCagrPercent {
    final invested = totalInvested;
    if (invested <= 0) return 0;
    final years = inputs.horizonMonths / 12.0;
    if (years <= 0) return 0;
    final ratio = nominalFutureValue / invested;
    if (ratio <= 0) return 0;
    return ((pow(ratio, 1 / years) - 1) * 100).toDouble();
  }
}
