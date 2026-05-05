import 'package:flutter/material.dart';

import '../splash/splash_asset_resolver.dart';

/// Splash de boot: fundo preto absoluto, **uma** logo centrada ([splashAsset]),
/// [ScaleTransition] 1.0→1.08 em loop, barra fina no rodapé durante **10 s** (sincronizada com o timer global).
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.splashAsset,
  });

  /// `devvoid_standard.png` ou logo do tema premium ([SplashAssetResolver]).
  final String splashAsset;

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

/// Cor da barra (Void / splash única; sem depender de tema).
const Color _splashProgressAccent = Color(0xFF00E5FF);

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _progressController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseScale;

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
  }

  @override
  void dispose() {
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: ScaleTransition(
              scale: _pulseScale,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Image.asset(
                  widget.splashAsset,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      SplashAssetResolver.standard,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    );
                  },
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
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          _splashProgressAccent,
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
