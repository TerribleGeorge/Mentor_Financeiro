import 'compound_interest_inputs.dart';

class CompoundInterestResult {
  final CompoundInterestInputs inputs;
  final double monthlyNominalRate;
  final double totalInvested;
  final double nominalFutureValue;
  final double nominalInterestGain;
  final double inflationAdjustedFutureValue;
  final double realGain;
  final int? snowballAccelerationMonth;

  const CompoundInterestResult({
    required this.inputs,
    required this.monthlyNominalRate,
    required this.totalInvested,
    required this.nominalFutureValue,
    required this.nominalInterestGain,
    required this.inflationAdjustedFutureValue,
    required this.realGain,
    required this.snowballAccelerationMonth,
  });

  /// Resumo para `saved_simulations.summary` no Firestore.
  Map<String, dynamic> summaryFirestoreMap({required String personaName}) => {
        'persona': personaName,
        'nominalFutureValue': nominalFutureValue,
        'realGain': realGain,
        'totalInvested': totalInvested,
        'nominalInterestGain': nominalInterestGain,
        'inflationAdjustedFutureValue': inflationAdjustedFutureValue,
        'monthlyNominalRate': monthlyNominalRate,
        if (snowballAccelerationMonth != null)
          'snowballAccelerationMonth': snowballAccelerationMonth,
      };
}
