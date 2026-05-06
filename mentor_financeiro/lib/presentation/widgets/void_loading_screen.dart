import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Splash de boot estilo Hollow Knight / Void: preto absoluto, névoa charcoal,
/// partículas escuras a subir lentamente, logo em [BoxFit.cover] e barra de 10 s.
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

/// Névoa charcoal + partículas do Void (subida lenta via [animationValue] 0–1).
class VoidParticlesPainter extends CustomPainter {
  VoidParticlesPainter({
    required this.animationValue,
    required this.particleColor,
    this.seed = 1337,
  });

  final double animationValue;
  final Color particleColor;
  final int seed;

  static const int _fogBlobCount = 24;
  static const int _particleCount = 96;
  static const double _particleRadius = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = Colors.black,
    );

    final rndFog = math.Random(seed);
    final fogPaint = Paint()
      ..color = const Color(0xFF0A0A12).withValues(alpha: 0.78)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 60);

    for (var i = 0; i < _fogBlobCount; i++) {
      final cx = rndFog.nextDouble() * size.width;
      final cy = rndFog.nextDouble() * size.height;
      final r = size.shortestSide * (0.14 + rndFog.nextDouble() * 0.4);
      canvas.drawCircle(Offset(cx, cy), r, fogPaint);
    }

    final rndDots = math.Random(seed + 404);
    final speckPaint = Paint()
      ..color = const Color(0xFF000000)
      ..isAntiAlias = true;

    final span = size.height + 140;
    for (var i = 0; i < _particleCount; i++) {
      final baseX = rndDots.nextDouble() * size.width;
      final phase = rndDots.nextDouble();
      // Mais rápido: usa 2.1x da animação e adiciona ziguezague no X.
      final t = ((animationValue * 2.1) + phase) % 1.0;
      final travel = t * span;
      final py = size.height + 48 - travel;
      final zig =
          math.sin((t * math.pi * 2 * 3.0) + (phase * math.pi * 2)) * 10.0;
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

  Color get _particleColor => const Color(0xFF000000);

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
          // Background (DevVoid_standard) + dimm.
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/devvoid_standard.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),
          SizedBox.expand(
            child: AnimatedBuilder(
              animation: _voidController,
              builder: (context, child) {
                return CustomPaint(
                  painter: VoidParticlesPainter(
                    animationValue: _voidController.value,
                    particleColor: _particleColor,
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
              fit: BoxFit.cover,
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              gaplessPlayback: true,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded || frame != null) {
                  return child;
                }
                return const SizedBox.shrink();
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/DevVoid_logo.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.high,
                  gaplessPlayback: true,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.layers_rounded,
                    size: 72,
                    color: widget.progressColor.withValues(alpha: 0.85),
                  ),
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
