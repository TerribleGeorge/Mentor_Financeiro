import 'dart:math';

import '../entities/compound_interest_inputs.dart';
import '../entities/compound_interest_result.dart';

/// Motor numérico de juros compostos com aportes mensais (fim do período).
class CompoundInterestCalculator {
  const CompoundInterestCalculator();

  CompoundInterestResult compute(CompoundInterestInputs inputs) {
    if (!inputs.isValid) {
      throw ArgumentError('Parâmetros inválidos para simulação.');
    }

    final n = inputs.horizonMonths;
    final p0 = inputs.initialAmount;
    final pmt = inputs.monthlyContribution;

    final monthlyRate = _monthlyNominalRate(inputs.interestRatePercent, inputs.ratePeriod);

    final fv = _futureValue(initial: p0, monthlyPayment: pmt, monthlyRate: monthlyRate, months: n);
    final invested = p0 + pmt * n;
    final nominalGain = fv - invested;

    final piMonthly = _monthlyRateFromAnnualPercent(inputs.annualInflationPercent);
    final deflator = pow(1 + piMonthly, n).toDouble();
    final realFv = deflator > 0 ? fv / deflator : fv;
    final realGain = realFv - invested;

    final snowballMonth = _snowballMonth(
      initial: p0,
      monthlyPayment: pmt,
      monthlyRate: monthlyRate,
      months: n,
    );

    return CompoundInterestResult(
      inputs: inputs,
      monthlyNominalRate: monthlyRate,
      totalInvested: invested,
      nominalFutureValue: fv,
      nominalInterestGain: nominalGain,
      inflationAdjustedFutureValue: realFv,
      realGain: realGain,
      snowballAccelerationMonth: snowballMonth,
    );
  }

  double _monthlyNominalRate(double percent, InterestRatePeriod period) {
    if (percent <= 0) return 0;
    final r = percent / 100;
    if (period == InterestRatePeriod.monthly) return r;
    return pow(1 + r, 1 / 12).toDouble() - 1;
  }

  double _monthlyRateFromAnnualPercent(double annualInflationPercent) {
    if (annualInflationPercent <= 0) return 0;
    final pi = annualInflationPercent / 100;
    return pow(1 + pi, 1 / 12).toDouble() - 1;
  }

  double _futureValue({
    required double initial,
    required double monthlyPayment,
    required double monthlyRate,
    required int months,
  }) {
    if (months <= 0) return initial;
    if (monthlyRate <= 0) {
      return initial + monthlyPayment * months;
    }
    final factor = pow(1 + monthlyRate, months).toDouble();
    final fromInitial = initial * factor;
    final fromPayments = monthlyPayment * (factor - 1) / monthlyRate;
    return fromInitial + fromPayments;
  }

  int? _snowballMonth({
    required double initial,
    required double monthlyPayment,
    required double monthlyRate,
    required int months,
  }) {
    if (months < 2 || monthlyRate <= 0 || monthlyPayment <= 0) return null;

    double balance = initial;
    for (var m = 1; m <= months; m++) {
      final interestAccrued = balance * monthlyRate;
      if (interestAccrued >= monthlyPayment) {
        return m;
      }
      balance = balance * (1 + monthlyRate) + monthlyPayment;
    }
    return null;
  }
}
