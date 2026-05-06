import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Splash de boot estilo Hollow Knight / Void: preto absoluto, névoa charcoal
/// volumosa (#080808), partículas #000000 rápidas, logo em [BoxFit.contain] e barra de 10 s.
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.splashAsset,
    this.backgroundColor = const Color(0xFF000000),
    this.progressColor = _defaultProgressColor,
    /// Cor subtil das partículas (opcional); por defeito preto sobre névoa charcoal.
    this.particleColor,
  });

  final String splashAsset;
  final Color backgroundColor;
  final Color progressColor;
  final Color? particleColor;

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

/// Névoa charcoal volumosa (#080808) + partículas pretas (#000000), HK Void.
class VoidParticlesPainter extends CustomPainter {
  VoidParticlesPainter({
    required this.animationValue,
    required this.particleColor,
    this.seed = 1337,
  });

  final double animationValue;
  final Color particleColor;
  final int seed;

  /// Fumo volumoso HK.
  static const Color _fogCharcoal = Color(0xFF080808);

  static const int _fogBlobCount = 42;
  static const int _particleCount = 140;
  /// Pontos nítidos (sem AA).
  static const double _particleRadius = 1.15;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final rndFog = math.Random(seed);
    final fogPaint = Paint()
      ..color = _fogCharcoal.withValues(alpha: 0.92)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 96);

    for (var i = 0; i < _fogBlobCount; i++) {
      final cx = rndFog.nextDouble() * size.width;
      final cy = rndFog.nextDouble() * size.height;
      final r = size.shortestSide * (0.18 + rndFog.nextDouble() * 0.52);
      canvas.drawCircle(Offset(cx, cy), r, fogPaint);
    }

    final rndDots = math.Random(seed + 404);
    final speckPaint = Paint()
      ..color = particleColor
      ..isAntiAlias = false;

    final span = size.height + 160;
    const speed = 8.5;
    for (var i = 0; i < _particleCount; i++) {
      final baseX = rndDots.nextDouble() * size.width;
      final phase = rndDots.nextDouble();
      final t = ((animationValue * speed) + phase) % 1.0;
      final travel = t * span;
      final py = size.height + 56 - travel;
      final zig =
          math.sin((t * math.pi * 2 * 5.2) + (phase * math.pi * 2)) * 8.0;
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

  /// Logo dentro de [Container] + halo ciano (derrete o corte do PNG).
  Widget _splashLogoWrapper(Widget imageChild) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withValues(alpha: 0.25),
                blurRadius: 40,
                spreadRadius: 2,
              ),
            ],
          ),
          child: imageChild,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _voidController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 28),
    )..repeat();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 0.95, end: 1.05).animate(
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(child: ColoredBox(color: Colors.black)),
          // Fundo DevVoid (manifesto: devvoid_standard.png).
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
          SizedBox.expand(
            child: AnimatedBuilder(
              animation: _voidController,
              builder: (context, child) {
                return CustomPaint(
                  painter: VoidParticlesPainter(
                    animationValue: _voidController.value,
                    particleColor: _particleBlack,
                  ),
                );
              },
            ),
          ),
          ScaleTransition(
            scale: _pulseScale,
            alignment: Alignment.center,
            child: Image.asset(
              widget.splashAsset,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              gaplessPlayback: true,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded || frame != null) {
                  return _splashLogoWrapper(child);
                }
                return const SizedBox.shrink();
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/DevVoid_logo.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.high,
                  gaplessPlayback: true,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.layers_rounded,
                    size: 72,
                    color: widget.progressColor.withValues(alpha: 0.85),
                  ),
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded || frame != null) {
                      return _splashLogoWrapper(child);
                    }
                    return const SizedBox.shrink();
                  },
                );
              },
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
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
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
    );
  }
}
