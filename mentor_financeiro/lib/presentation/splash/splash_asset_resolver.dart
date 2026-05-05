import '../../services/app_theme_controller.dart';

/// Escolhe a arte da splash com base no entitlement RevenueCat e no tema guardado.
abstract final class SplashAssetResolver {
  static const String standard = 'assets/images/devvoid_standard.png';
  static const String cyber = 'assets/images/devvoid_cyber.png';
  static const String grimm = 'assets/images/devvoid_grimm.png';
  static const String hive = 'assets/images/devvoid_hive.png';

  /// Premium: Cyber → Grimm → Hive conforme [AppThemeMode]; Void usa standard.
  /// Não premium ou dados inválidos: sempre [standard].
  static String resolve({
    required bool isPremium,
    required AppThemeMode theme,
  }) {
    try {
      if (!isPremium) return standard;
      return switch (theme) {
        AppThemeMode.cyber => cyber,
        AppThemeMode.obsidian => grimm,
        AppThemeMode.glacier => hive,
        AppThemeMode.voidTheme => standard,
      };
    } catch (_) {
      return standard;
    }
  }
}
