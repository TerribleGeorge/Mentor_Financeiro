import '../../services/app_theme_controller.dart';

/// Arte da splash: fundo full-bleed + logo central (sempre [logoSplash] nas presets).
typedef SplashBranding = ({
  String logoAsset,
  String backgroundAsset,
});

/// Escolhe fundo e logo conforme entitlement Premium e tema guardado.
abstract final class SplashAssetResolver {
  /// Logo central (especificação do produto — não distorcer; largura = largura do ecrã).
  static const String logoSplash = 'assets/images/devvoid_logo.png';

  /// Fundos por tema (full-bleed, [BoxFit.cover]).
  static const String freeBackground = 'assets/images/devvoid_logo.png';
  static const String grimmBackground = 'assets/images/devvoid_grimm.png';
  static const String cyberBackground = 'assets/images/bg_cyber.png';
  static const String hiveBackground = 'assets/images/hive_bg.png';

  /// Alias para outros ecrãs (ex.: pré-visualização).
  static const String cyberBg = cyberBackground;

  /// Legado / compat.
  static const String devVoidLogo = logoSplash;

  /// Free / Void / fallback.
  static SplashBranding resolveDefaultSplash() {
    return (
      logoAsset: logoSplash,
      backgroundAsset: freeBackground,
    );
  }

  /// Cyber / Grimm / Hive — apenas se [AppThemeMode.requiresPremiumEntitlement].
  static SplashBranding resolvePremiumSplash(AppThemeMode theme) {
    return switch (theme) {
      AppThemeMode.cyber => (
          logoAsset: logoSplash,
          backgroundAsset: cyberBackground,
        ),
      AppThemeMode.obsidian => (
          logoAsset: logoSplash,
          backgroundAsset: grimmBackground,
        ),
      AppThemeMode.glacier => (
          logoAsset: logoSplash,
          backgroundAsset: hiveBackground,
        ),
      AppThemeMode.voidTheme => resolveDefaultSplash(),
    };
  }

  static SplashBranding resolveSplash({
    required bool isPremium,
    required AppThemeMode theme,
  }) {
    if (isPremium && theme.requiresPremiumEntitlement) {
      return resolvePremiumSplash(theme);
    }
    return resolveDefaultSplash();
  }
}
