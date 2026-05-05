import 'dart:ui';

import 'package:flutter/material.dart';

import 'void_smoke_painter.dart';

/// Loading devvoid (estética Hollow Knight Void): fumaça ascendente + logo com brilho.
/// Logo: declarado em pubspec em [logoAsset] (bundle Flutter).
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({super.key});

  /// Caminho no bundle; deve coincidir com `flutter: assets:` em pubspec.yaml.
  static const String logoAsset = 'assets/images/void_logo.png';
  static const String fallbackAsset = 'assets/icons/void_icon.png';

  /// Tempo mínimo de exibição antes de navegar para a Home (splash pós-login).
  /// Usar também no arranque global via [waitMinimumHold].
  static const Duration minimumNavigationHold = Duration(seconds: 10);

  static Future<void> waitMinimumHold() =>
      Future<void>.delayed(minimumNavigationHold);

  @override
  State<VoidLoadingScreen> createState() => _VoidLoadingScreenState();
}

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseOpacity;
  late final Animation<double> _pulseScale;
  late final AnimationController _smokeController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseOpacity = Tween<double>(begin: 0.4, end: 1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseScale = Tween<double>(begin: 0.94, end: 1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _smokeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
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
            child: RepaintBoundary(
              child: CustomPaint(
                painter: VoidSmokePainter(animation: _smokeController),
              ),
            ),
          ),
          Center(
            child: RepaintBoundary(
              child: SizedBox(
                width: 260,
                height: 260,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          width: 210,
                          height: 210,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _pulseOpacity,
                      child: ScaleTransition(
                        scale: _pulseScale,
                        child: Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00D9FF).withValues(alpha: 0.32),
                                blurRadius: 32,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.85),
                                blurRadius: 18,
                                spreadRadius: -4,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            VoidLoadingScreen.logoAsset,
                            fit: BoxFit.contain,
                            gaplessPlayback: true,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              VoidLoadingScreen.fallbackAsset,
                              fit: BoxFit.contain,
                              gaplessPlayback: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
