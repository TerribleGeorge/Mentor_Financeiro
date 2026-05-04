enum InterestRatePeriod {
  annual,
  monthly,
}

enum HorizonUnit {
  months,
  years,
}

class CompoundInterestInputs {
  final double initialAmount;
  final double monthlyContribution;
  final double interestRatePercent;
  final InterestRatePeriod ratePeriod;
  final int horizonValue;
  final HorizonUnit horizonUnit;
  final double annualInflationPercent;

  const CompoundInterestInputs({
    required this.initialAmount,
    required this.monthlyContribution,
    required this.interestRatePercent,
    required this.ratePeriod,
    required this.horizonValue,
    required this.horizonUnit,
    required this.annualInflationPercent,
  });

  int get horizonMonths =>
      horizonUnit == HorizonUnit.years ? horizonValue * 12 : horizonValue;

  bool get isValid =>
      initialAmount >= 0 &&
      monthlyContribution >= 0 &&
      horizonMonths > 0 &&
      interestRatePercent >= 0 &&
      annualInflationPercent >= 0 &&
      !(initialAmount == 0 && monthlyContribution == 0);
}
