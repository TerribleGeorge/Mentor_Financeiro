import 'dart:ui';

import 'package:flutter/material.dart';

import '../presentation/widgets/smoke_vortex_particles.dart';
import '../services/app_theme_controller.dart';
import '../services/theme_controller.dart';
import '../theme/theme_brand_assets.dart';

/// Fundo global: modo Void (DevVoid + partículas) ou arte blur legada em tema claro.
class MentorAppBackdrop extends StatefulWidget {
  const MentorAppBackdrop({super.key, required this.child});

  final Widget? child;

  static const String _legacyPreferredBg = ThemeBrandAssets.voidBackdropDark;
  static const String _legacyFallbackBg = ThemeBrandAssets.legacyLightFallback;

  static Future<String> _resolveLegacyBgAsset(BuildContext context) async {
    try {
      final manifest = await DefaultAssetBundle.of(
        context,
      ).loadString('AssetManifest.json');
      if (manifest.contains(_legacyPreferredBg)) return _legacyPreferredBg;
    } catch (_) {}
    return _legacyFallbackBg;
  }

  @override
  State<MentorAppBackdrop> createState() => _MentorAppBackdropState();
}

class _MentorAppBackdropState extends State<MentorAppBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _voidParticleController;

  @override
  void initState() {
    super.initState();
    _voidParticleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 48),
    )..repeat();
  }

  @override
  void dispose() {
    _voidParticleController.dispose();
    super.dispose();
  }

  String _assetForPreset(AppThemeMode preset) =>
      ThemeBrandAssets.backdropAsset(preset);

  Color _accentForPreset(AppThemeMode preset) {
    switch (preset) {
      case AppThemeMode.voidTheme:
        return const Color(0xFF6B7280);
      case AppThemeMode.cyber:
        return const Color(0xFFFFEA00);
      case AppThemeMode.obsidian:
        return const Color(0xFFFF1744);
      case AppThemeMode.glacier:
        return const Color(0xFFFF6D00);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        AppThemeController.instance,
        ThemeController.instance,
      ]),
      builder: (context, _) {
        final brightness = Theme.of(context).brightness;
        final isDark = brightness == Brightness.dark;
        final preset = AppThemeController.instance.themeMode;

        if (isDark) {
          final asset = _assetForPreset(preset);
          final accent = _accentForPreset(preset);
          return Stack(
            fit: StackFit.expand,
            children: [
              const Positioned.fill(child: ColoredBox(color: Colors.black)),
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.5),
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    asset,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) =>
                        const ColoredBox(color: Colors.black),
                  ),
                ),
              ),
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: _voidParticleController,
                  builder: (context, _) {
                    return CustomPaint(
                      painter: SmokeVortexPainter(
                        animationValue: _voidParticleController.value,
                        accentTint: accent,
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF000000).withValues(alpha: 0.35),
                        Colors.transparent,
                        const Color(0xFF000000).withValues(alpha: 0.4),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(child: widget.child ?? const SizedBox.shrink()),
            ],
          );
        }

        return FutureBuilder<String>(
          future: preset == AppThemeMode.voidTheme
              ? MentorAppBackdrop._resolveLegacyBgAsset(context)
              : Future<String>.value(_assetForPreset(preset)),
          builder: (context, snap) {
            final asset = snap.data ?? _assetForPreset(preset);
            final tint = _accentForPreset(preset);
            return Stack(
              fit: StackFit.expand,
              children: [
                const Positioned.fill(
                  child: ColoredBox(color: Color(0xFFF8FAFC)),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(asset),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                      child: Container(
                        color: Colors.white.withValues(alpha: 0.58),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.82),
                          tint.withValues(alpha: 0.10),
                          Colors.white.withValues(alpha: 0.76),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(child: widget.child ?? const SizedBox.shrink()),
              ],
            );
          },
        );
      },
    );
  }
}
