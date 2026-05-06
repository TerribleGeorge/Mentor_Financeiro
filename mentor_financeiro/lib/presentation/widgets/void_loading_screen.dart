import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Splash Flutter Void: [DevVoid_standard] centrado, véu preto 0.5, partículas visíveis.
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.splashAsset,
    this.backgroundColor = const Color(0xFF000000),
    this.progressColor = _defaultProgressColor,
    this.particleColor,
  });

  /// Fallback se [kVoidSplashCenter] falhar.
  final String splashAsset;
  final Color backgroundColor;
  final Color progressColor;
  final Color? particleColor;

  static const String kVoidSplashCenter = 'assets/images/DevVoid_standard.png';

  static const Duration bootstrapSynchronizationHold = Duration(seconds: 10);

  static Future<void> waitBootstrapSynchronizationHold() =>
      Future<void>.delayed(bootstrapSynchronizationHold);

  static const Duration minimumNavigationHold = Duration(seconds: 10);

  static Future<void> waitMinimumHold() =>
      Future<void>.delayed(minimumNavigationHold);

  @Deprecated('Use waitBootstrapSynchronizationHold (10 s).')
  static Future<void> waitMinimumBootstrapVisualHold() =>
      waitBootstrapSynchronizationHold();

  @override
  State<VoidLoadingScreen> createState() => _VoidLoadingScreenState();
}

const Color _defaultProgressColor = Color(0xFFE5E7EB);

/// Fundo preto absoluto + fumo charcoal + partículas pretas (camada atrás da arte).
class VoidParticlesPainter extends CustomPainter {
  VoidParticlesPainter({
    required this.animationValue,
    required this.particleColor,
    this.seed = 1337,
  });

  final double animationValue;
  final Color particleColor;
  final int seed;

  static const Color _fogCharcoal = Color(0xFF080808);

  static const int _fogBlobCount = 28;
  static const int _particleCount = 120;
  static const double _particleRadius = 1.35;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = Colors.black,
    );

    final rndFog = math.Random(seed);
    final fogPaint = Paint()
      ..color = _fogCharcoal.withValues(alpha: 0.72)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 72);

    for (var i = 0; i < _fogBlobCount; i++) {
      final cx = rndFog.nextDouble() * size.width;
      final cy = rndFog.nextDouble() * size.height;
      final r = size.shortestSide * (0.14 + rndFog.nextDouble() * 0.42);
      canvas.drawCircle(Offset(cx, cy), r, fogPaint);
    }

    final rndDots = math.Random(seed + 404);
    final speckPaint = Paint()
      ..color = particleColor.withValues(alpha: 0.92)
      ..isAntiAlias = false;

    final span = size.height + 140;
    const speed = 4.2;
    for (var i = 0; i < _particleCount; i++) {
      final baseX = rndDots.nextDouble() * size.width;
      final phase = rndDots.nextDouble();
      final t = ((animationValue * speed) + phase) % 1.0;
      final travel = t * span;
      final py = size.height + 48 - travel;
      final zig =
          math.sin((t * math.pi * 2 * 4.5) + (phase * math.pi * 2)) * 8.0;
      final px = (baseX + zig).clamp(0.0, size.width);
      canvas.drawCircle(Offset(px, py), _particleRadius, speckPaint);
    }
  }

  @override
  bool shouldRepaint(covariant VoidParticlesPainter oldDelegate) => true;
}

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _voidController;
  late final AnimationController _progressController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseScale;

  static const Color _particleBlack = Color(0xFF000000);

  @override
  void initState() {
    super.initState();
    _voidController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 28),
    )..repeat(); // fumo + partículas no CustomPainter

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _voidController.dispose();
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final particleTint = widget.particleColor ?? _particleBlack;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ColoredBox(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox.expand(
              child: AnimatedBuilder(
                animation: _voidController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: VoidParticlesPainter(
                      animationValue: _voidController.value,
                      particleColor: particleTint,
                    ),
                  );
                },
              ),
            ),
            ScaleTransition(
              scale: _pulseScale,
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        VoidLoadingScreen.kVoidSplashCenter,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        gaplessPlayback: true,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            widget.splashAsset,
                            fit: BoxFit.contain,
                            gaplessPlayback: true,
                            errorBuilder: (context, err, st) => Icon(
                              Icons.layers_rounded,
                              size: 72,
                              color: widget.progressColor.withValues(alpha: 0.85),
                            ),
                          );
                        },
                      ),
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: AnimatedBuilder(
                    animation: _progressController,
                    builder: (context, child) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: _progressController.value.clamp(0.0, 1.0),
                          minHeight: 3,
                          backgroundColor:
                              Colors.white.withValues(alpha: 0.1),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            widget.progressColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
