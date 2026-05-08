import 'package:flutter_test/flutter_test.dart';
import 'package:mentor_financeiro/services/app_theme_controller.dart';
import 'package:mentor_financeiro/theme/theme_brand_assets.dart';

void main() {
  test('cada AppThemeMode tem backdrop e política anti-cadeado', () {
    ThemeBrandAssets.assertPolicy();

    for (final mode in AppThemeMode.values) {
      final path = ThemeBrandAssets.backdropAsset(mode);
      expect(path, startsWith('assets/images/'));
      expect(path.endsWith('.png'), isTrue);
    }

    expect(
      ThemeBrandAssets.backdropAsset(AppThemeMode.obsidian),
      isNot(ThemeBrandAssets.legacyGrimmFullBleedWithLock),
    );
    expect(
      ThemeBrandAssets.backdropAsset(AppThemeMode.glacier),
      isNot(ThemeBrandAssets.legacyHiveFullBleedWithLock),
    );
    expect(
      ThemeBrandAssets.premiumSplashBackground(AppThemeMode.glacier),
      isNot(ThemeBrandAssets.legacyHiveFullBleedWithLock),
    );
  });

  test('thumbnail: só Void é null', () {
    expect(
      ThemeBrandAssets.thumbnailAsset(AppThemeMode.voidTheme),
      isNull,
    );
    for (final mode in AppThemeMode.values) {
      if (mode == AppThemeMode.voidTheme) continue;
      final t = ThemeBrandAssets.thumbnailAsset(mode);
      expect(t, isNotNull);
      expect(t, startsWith('assets/images/'));
    }
  });
}
