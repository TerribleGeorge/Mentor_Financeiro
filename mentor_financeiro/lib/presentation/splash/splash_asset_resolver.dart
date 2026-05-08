import '../../services/app_theme_controller.dart';
import '../../theme/theme_brand_assets.dart';

/// Arte da splash: fundo full-bleed + logo central.
typedef SplashBranding = ({
  String logoAsset,
  String backgroundAsset,
});

/// Escolhe fundo e logo conforme entitlement Premium e tema guardado.
abstract final class SplashAssetResolver {
  static const String logoSplash = ThemeBrandAssets.logoSplash;
  static const String freeBackground = ThemeBrandAssets.freeSplashBackground;
  static const String grimmBackground = ThemeBrandAssets.grimmBackdrop;
  static const String cyberBackground = ThemeBrandAssets.cyberBackdrop;
  static const String hiveBackground = ThemeBrandAssets.hiveBackdrop;

  /// Outros ecrãs (ex.: loader Mentoria).
  static const String cyberBg = ThemeBrandAssets.cyberBackdrop;

  /// Legado / compat.
  static const String devVoidLogo = ThemeBrandAssets.logoSplash;

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
