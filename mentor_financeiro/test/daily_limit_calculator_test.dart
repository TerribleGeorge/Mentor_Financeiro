import 'package:flutter_test/flutter_test.dart';
import 'package:mentor_financeiro/domain/finance/daily_limit_calculator.dart';

void main() {
  group('DailyLimitCalculator.parseMoney', () {
    test('parses Brazilian money formats', () {
      expect(DailyLimitCalculator.parseMoney('1500,00'), 1500);
      expect(DailyLimitCalculator.parseMoney('1.500,00'), 1500);
      expect(DailyLimitCalculator.parseMoney('R\$ 2.345,67'), 2345.67);
    });

    test('parses international money formats', () {
      expect(DailyLimitCalculator.parseMoney('1500.00'), 1500);
      expect(DailyLimitCalculator.parseMoney('1,500.00'), 1500);
      expect(DailyLimitCalculator.parseMoney(r'$ 2,345.67'), 2345.67);
    });

    test('keeps thousand-only separators as whole values', () {
      expect(DailyLimitCalculator.parseMoney('1.500'), 1500);
      expect(DailyLimitCalculator.parseMoney('1,500'), 1500);
    });
  });
}
