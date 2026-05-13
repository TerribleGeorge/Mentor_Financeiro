import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  group('DailyLimitCalculator.computeFromPrefs', () {
    test('applies default cap when formula raw exceeds default ceiling', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({
        'valor_Saldo Atual': '100000',
        'ativo_Saldo Atual': true,
      });
      final prefs = await SharedPreferences.getInstance();
      final r = DailyLimitCalculator.computeFromPrefs(prefs);
      expect(r.rawLimit, greaterThan(kDefaultDailySpendCapBrl));
      expect(r.displayLimit, kDefaultDailySpendCapBrl);
      expect(r.limitWasCapped, isTrue);
      expect(r.infoMessage, isNotNull);
    });

    test('cap 0 disables ceiling (display equals raw when positive)', () async {
      SharedPreferences.setMockInitialValues({
        'valor_Saldo Atual': '100000',
        'ativo_Saldo Atual': true,
        kDailySpendCapPrefKey: 0.0,
      });
      final prefs = await SharedPreferences.getInstance();
      final r = DailyLimitCalculator.computeFromPrefs(prefs);
      expect(r.limitWasCapped, isFalse);
      expect(r.displayLimit, r.rawLimit);
      expect(r.infoMessage, isNull);
    });

    test('custom cap is applied when lower than raw', () async {
      SharedPreferences.setMockInitialValues({
        'valor_Saldo Atual': '100000',
        'ativo_Saldo Atual': true,
        kDailySpendCapPrefKey: 400.0,
      });
      final prefs = await SharedPreferences.getInstance();
      final r = DailyLimitCalculator.computeFromPrefs(prefs);
      expect(r.displayLimit, 400);
      expect(r.limitWasCapped, isTrue);
    });
  });

  group('DailyLimitCalculator.suggestDailySpendCaps', () {
    test('includes fixed 50, tiers from positive raw, and formula option', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({
        'valor_Saldo Atual': '50000',
        'ativo_Saldo Atual': true,
      });
      final prefs = await SharedPreferences.getInstance();
      final s = DailyLimitCalculator.suggestDailySpendCaps(prefs);
      expect(s.any((e) => e.id == 'cap50' && e.valueBrl == 50), isTrue);
      expect(s.any((e) => e.usesFormulaWithoutCap), isTrue);
      expect(s.any((e) => e.id == 'tight'), isTrue);
    });
  });
}
