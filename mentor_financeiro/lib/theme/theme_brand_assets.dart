import '../services/app_theme_controller.dart';

/// Caminhos de imagem por [AppThemeMode]. Única fonte de verdade — alinhar com
/// `pubspec.yaml`.
///
/// **Política:** `bg_grimm.png` e `hive_bg.png` não são usados como fundo de app
/// nem splash (arte inclui cadeado decorativo). Usar `devvoid_grimm.png` /
/// `devvoid_hive.png` para full-bleed.
abstract final class ThemeBrandAssets {
  ThemeBrandAssets._();

  static const String logoSplash = 'assets/images/DevVoid_logo.png';

  /// Splash utilizador free / fallback de fundo “marca”.
  static const String freeSplashBackground = logoSplash;

  static const String voidBackdropDark = 'assets/images/devvoid_standard.png';

  static const String cyberBackdrop = 'assets/images/bg_cyber.png';
  static const String grimmBackdrop = 'assets/images/devvoid_grimm.png';
  static const String hiveBackdrop = 'assets/images/devvoid_hive.png';

  static const String cyberThumbnail = 'assets/images/devvoid_cyber.png';
  static const String grimmThumbnail = 'assets/images/devvoid_grimm.png';
  static const String hiveThumbnail = 'assets/images/devvoid_hive.png';

  /// Referência documental — não usar como fundo principal.
  static const String legacyGrimmFullBleedWithLock =
      'assets/images/bg_grimm.png';
  static const String legacyHiveFullBleedWithLock = 'assets/images/hive_bg.png';

  static const String legacyLightFallback = 'assets/images/bg_cyber.png';

  /// Fundo escuro atrás do stack global ([MentorAppBackdrop]).
  static String backdropAsset(AppThemeMode mode) => switch (mode) {
    AppThemeMode.voidTheme => voidBackdropDark,
    AppThemeMode.cyber => cyberBackdrop,
    AppThemeMode.obsidian => grimmBackdrop,
    AppThemeMode.glacier => hiveBackdrop,
  };

  /// Fundo full-bleed da splash quando o utilizador tem premium neste preset.
  static String premiumSplashBackground(AppThemeMode mode) => switch (mode) {
    AppThemeMode.cyber => cyberBackdrop,
    AppThemeMode.obsidian => grimmBackdrop,
    AppThemeMode.glacier => hiveBackdrop,
    AppThemeMode.voidTheme => freeSplashBackground,
  };

  /// Miniatura na grelha de temas; Void usa só ícone.
  static String? thumbnailAsset(AppThemeMode mode) => switch (mode) {
    AppThemeMode.voidTheme => null,
    AppThemeMode.cyber => cyberThumbnail,
    AppThemeMode.obsidian => grimmThumbnail,
    AppThemeMode.glacier => hiveThumbnail,
  };

  /// Garante que presets premium não apontam por engano para arte com cadeado.
  static void assertPolicy() {
    assert(
      backdropAsset(AppThemeMode.obsidian) != legacyGrimmFullBleedWithLock,
      'Grimm: não usar bg_grimm como backdrop.',
    );
    assert(
      backdropAsset(AppThemeMode.glacier) != legacyHiveFullBleedWithLock,
      'Hive: não usar hive_bg como backdrop.',
    );
    assert(
      premiumSplashBackground(AppThemeMode.glacier) !=
          legacyHiveFullBleedWithLock,
      'Hive splash: não usar hive_bg.',
    );
  }
}
