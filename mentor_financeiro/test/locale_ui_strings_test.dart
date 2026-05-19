import 'package:flutter_test/flutter_test.dart';
import 'package:mentor_financeiro/services/locale_controller.dart';
import 'package:mentor_financeiro/services/locale_ui_strings.dart';

void main() {
  test('todos os idiomas selecionáveis têm textos visíveis de UI', () {
    for (final option in LocaleController.languageOptions) {
      final strings = LocaleUiStrings.forCode(option.code);

      expect(strings.apply, isNotEmpty, reason: option.code);
      expect(strings.languagePageTitle, isNotEmpty, reason: option.code);
      expect(strings.settingsAppLanguage, isNotEmpty, reason: option.code);
      expect(strings.navHome, isNotEmpty, reason: option.code);
      expect(strings.navProfile, isNotEmpty, reason: option.code);
    }
  });
}
