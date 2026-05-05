import 'package:flutter/material.dart';

import '../splash/splash_asset_resolver.dart';
import 'void_smoke_painter.dart';

/// Splash de arranque: arte full-screen escolhida por entitlement + tema nas prefs.
/// [splashAsset] deve estar em `pubspec.yaml` sob `flutter: assets:`.
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.splashAsset,
  });

  final String splashAsset;

  /// Tempo mínimo de exibição antes de navegar para a Home (splash pós-login).
  static const Duration minimumNavigationHold = Duration(seconds: 10);

  static Future<void> waitMinimumHold() =>
      Future<void>.delayed(minimumNavigationHold);

  /// Tempo mínimo visual no arranque (paralelo ao resto do boot).
  static const Duration minimumBootstrapVisualHold = Duration(milliseconds: 1400);

  static Future<void> waitMinimumBootstrapVisualHold() =>
      Future<void>.delayed(minimumBootstrapVisualHold);

  @override
  State<VoidLoadingScreen> createState() => _VoidLoadingScreenState();
}

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _smokeController;

  @override
  void initState() {
    super.initState();
    _smokeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _smokeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: Colors.black),
          Positioned.fill(
            child: Image.asset(
              widget.splashAsset,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              gaplessPlayback: true,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  SplashAssetResolver.standard,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  gaplessPlayback: true,
                );
              },
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.14,
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: VoidSmokePainter(animation: _smokeController),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.05,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.35),
                    ],
                    stops: const [0.55, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
