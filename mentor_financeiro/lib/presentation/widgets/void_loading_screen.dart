import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particles_flutter/engine.dart';


/// Splash de boot: fundo preto absoluto, **uma** logo centrada ([splashAsset]),
/// [ScaleTransition] 1.0→1.08 em loop, barra fina no rodapé durante **10 s** (sincronizada com o timer global).
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.splashAsset,
    this.backgroundColor = Colors.black,
    this.progressColor = _defaultProgressColor,
    this.particlesColor = const Color(0xFF0B0B0B),
  });

  /// Logo central da Splash (use `DevVoid_logo.png`).
  final String splashAsset;

  final Color backgroundColor;
  final Color progressColor;
  final Color particlesColor;

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

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _progressController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseScale;
  late List<Particle> _particles;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    _particles = _createFogParticles(widget.particlesColor);
  }

  @override
  void didUpdateWidget(covariant VoidLoadingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.particlesColor != widget.particlesColor) {
      _particles = _createFogParticles(widget.particlesColor);
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  List<Particle> _createFogParticles(Color base) {
    final rng = Random(1337);

    // Mantém leve: poucas partículas grandes, movimento lento.
    // Visual "névoa volumétrica": círculos grandes, opacidades baixas e velocidades suaves.
    const count = 42;
    double sign() => rng.nextBool() ? 1 : -1;

    return List<Particle>.generate(count, (_) {
      final radius = 18 + rng.nextDouble() * 42; // 18..60
      final opacity = 0.05 + rng.nextDouble() * 0.12; // 0.05..0.17
      final driftX = (6 + rng.nextDouble() * 18) * sign(); // -24..24
      // Movimento ascendente predominante.
      final driftY = -(12 + rng.nextDouble() * 28); // -40..-12

      return CircularParticle(
        color: base.withValues(alpha: opacity),
        radius: radius,
        velocity: Offset(driftX, driftY),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Profundidade extra para misturar a "fumaça" com o vazio (sem aparência de figurinha).
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.05,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          // Conteúdo principal: partículas atrás + logo DV ao centro com pulso.
          // IMPORTANTE: partículas nunca acima da logo.
          Stack(
            fit: StackFit.expand,
            children: [
              IgnorePointer(
                child: Particles(
                  particles: _particles,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  boundType: BoundType.WrapAround,
                ),
              ),
              Center(
                child: ScaleTransition(
                  scale: _pulseScale,
                  child: SizedBox.expand(
                    child: Image.asset(
                      widget.splashAsset,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      filterQuality: FilterQuality.high,
                      gaplessPlayback: true,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded || frame != null) return child;
                        return const ColoredBox(color: Colors.black);
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/DevVoid_logo.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          filterQuality: FilterQuality.high,
                          gaplessPlayback: true,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
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
