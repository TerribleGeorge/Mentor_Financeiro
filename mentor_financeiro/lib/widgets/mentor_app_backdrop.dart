import 'dart:ui';

import 'package:flutter/material.dart';

import '../presentation/widgets/void_loading_screen.dart';
import '../services/app_theme_controller.dart';
import '../services/theme_controller.dart';

/// Fundo global: modo Void (DevVoid + partículas) ou arte blur legada em tema claro.
class MentorAppBackdrop extends StatefulWidget {
  const MentorAppBackdrop({super.key, required this.child});

  final Widget? child;

  static const String _legacyPreferredBg = 'assets/images/devvoid_standard.png';
  static const String _legacyFallbackBg = 'assets/images/bg_cyber.png';

  static Future<String> _resolveLegacyBgAsset(BuildContext context) async {
    try {
      final manifest =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
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
      duration: const Duration(seconds: 28),
    )..repeat();
  }

  @override
  void dispose() {
    _voidParticleController.dispose();
    super.dispose();
  }

  bool _useVoidBackdrop(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final preset = AppThemeController.instance.themeMode;
    return brightness == Brightness.dark ||
        preset == AppThemeMode.voidTheme;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        AppThemeController.instance,
        ThemeController.instance,
      ]),
      builder: (context, _) {
        final showVoid = _useVoidBackdrop(context);

        if (showVoid) {
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
                    'assets/images/devvoid_standard.png',
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
                      painter: VoidParticlesPainter(
                        animationValue: _voidParticleController.value,
                        particleColor: const Color(0xFF000000),
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
              Positioned.fill(
                child: widget.child ?? const SizedBox.shrink(),
              ),
            ],
          );
        }

        return FutureBuilder<String>(
          future: MentorAppBackdrop._resolveLegacyBgAsset(context),
          builder: (context, snap) {
            final asset = snap.data ?? MentorAppBackdrop._legacyFallbackBg;
            return Stack(
              fit: StackFit.expand,
              children: [
                const Positioned.fill(child: ColoredBox(color: Colors.black)),
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
                        color: Colors.black.withValues(alpha: 0.28),
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
                          const Color(0xFF000000).withValues(alpha: 0.65),
                          const Color(0xFF07121B).withValues(alpha: 0.25),
                          const Color(0xFF000000).withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: widget.child ?? const SizedBox.shrink(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
