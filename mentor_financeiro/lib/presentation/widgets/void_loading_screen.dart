import 'package:flutter/material.dart';

import '../../services/app_theme_controller.dart';
import '../splash/splash_asset_resolver.dart';
import 'void_smoke_painter.dart';

/// Splash: fundo temático + logo DV com pulso + barra de progresso real (10 s).
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.splashAsset,
  });

  final String splashAsset;

  static const String logoAsset = 'assets/images/DevVoid_logo.png';

  /// Alinhado ao timer da barra: espera mínima antes da Home (paralelo ao resto do boot).
  static const Duration bootstrapSynchronizationHold = Duration(seconds: 10);

  static Future<void> waitBootstrapSynchronizationHold() =>
      Future<void>.delayed(bootstrapSynchronizationHold);

  /// Splash pós-login (mantido para compatibilidade com fluxos antigos).
  static const Duration minimumNavigationHold = Duration(seconds: 10);

  static Future<void> waitMinimumHold() =>
      Future<void>.delayed(minimumNavigationHold);

  @Deprecated('Use waitBootstrapSynchronizationHold (10 s).')
  static Future<void> waitMinimumBootstrapVisualHold() =>
      waitBootstrapSynchronizationHold();

  @override
  State<VoidLoadingScreen> createState() => _VoidLoadingScreenState();
}

Color _neonAccentForTheme(AppThemeMode mode) {
  return switch (mode) {
    AppThemeMode.voidTheme => const Color(0xFF00E5FF),
    AppThemeMode.cyber => const Color(0xFF00F0FF),
    AppThemeMode.obsidian => const Color(0xFFFF3355),
    AppThemeMode.glacier => const Color(0xFF38BDF8),
  };
}

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with TickerProviderStateMixin {
  static const Color _kBlack = Color(0xFF000000);

  late final AnimationController _smokeController;
  late final AnimationController _progressController;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _smokeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  double _pulseScaleForAnimation() {
    final t = Curves.easeInOut.transform(_pulseController.value);
    return 1.0 + t * 0.08;
  }

  @override
  void dispose() {
    _smokeController.dispose();
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBlack,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: _kBlack),
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
                );
              },
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.1,
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
                    radius: 1.0,
                    colors: [
                      Colors.transparent,
                      _kBlack.withValues(alpha: 0.55),
                    ],
                    stops: const [0.55, 1.0],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseScaleForAnimation(),
                          child: child,
                        );
                      },
                      child: ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (Rect bounds) {
                          return RadialGradient(
                            center: Alignment.center,
                            radius: 1.15,
                            colors: [
                              Colors.white,
                              Colors.white.withValues(alpha: 0.0),
                            ],
                            stops: const [0.42, 1.0],
                          ).createShader(bounds);
                        },
                        child: Image.asset(
                          VoidLoadingScreen.logoAsset,
                          width: 220,
                          fit: BoxFit.contain,
                          gaplessPlayback: true,
                          filterQuality: FilterQuality.high,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              SplashAssetResolver.standard,
                              width: 220,
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    ListenableBuilder(
                      listenable: AppThemeController.instance,
                      builder: (context, _) {
                        final accent = _neonAccentForTheme(
                          AppThemeController.instance.themeMode,
                        );
                        return AnimatedBuilder(
                          animation: _progressController,
                          builder: (context, child) {
                            return _NeonLinearProgress(
                              progress: _progressController.value.clamp(0.0, 1.0),
                              accent: accent,
                            );
                          },
                        );
                      },
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

/// Barra fina com brilho neon sobre fundo escuro.
class _NeonLinearProgress extends StatelessWidget {
  const _NeonLinearProgress({
    required this.progress,
    required this.accent,
  });

  final double progress;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.75),
              blurRadius: 12,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: accent.withValues(alpha: 0.35),
              blurRadius: 22,
              spreadRadius: -4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            backgroundColor: Colors.white.withValues(alpha: 0.08),
            valueColor: AlwaysStoppedAnimation<Color>(accent),
          ),
        ),
      ),
    );
  }
}
