import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../splash/splash_asset_resolver.dart';
import 'splash_animated_smoke.dart';

/// Splash edge-to-edge: fundo [BoxFit.cover] → logo largura total ([BoxFit.fitWidth]) → fumaça por gradiente.
class VoidLoadingScreen extends StatefulWidget {
  const VoidLoadingScreen({
    super.key,
    required this.backgroundAsset,
    this.logoAsset = SplashAssetResolver.logoSplash,
    this.backgroundColor = const Color(0xFF000000),
    this.applyImmersiveSystemUi = true,
  });

  final String backgroundAsset;

  final String logoAsset;

  final Color backgroundColor;

  final bool applyImmersiveSystemUi;

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

class _VoidLoadingScreenState extends State<VoidLoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _smokeController;

  @override
  void initState() {
    super.initState();
    if (widget.applyImmersiveSystemUi) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
        ),
      );
    }
    _smokeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 11),
    )..repeat();
  }

  @override
  void dispose() {
    if (widget.applyImmersiveSystemUi) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
        ),
      );
    }
    _smokeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgPath = widget.backgroundAsset;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: SizedBox.expand(
                child: bgPath.isEmpty
                    ? ColoredBox(color: widget.backgroundColor)
                    : Image.asset(
                        bgPath,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        gaplessPlayback: true,
                        filterQuality: FilterQuality.high,
                        errorBuilder: (context, error, stackTrace) =>
                            ColoredBox(color: widget.backgroundColor),
                      ),
              ),
            ),
            Center(
              child: SizedBox(
                width: screenWidth,
                child: Image.asset(
                  widget.logoAsset,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  gaplessPlayback: true,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) =>
                      ColoredBox(color: widget.backgroundColor),
                ),
              ),
            ),
            Positioned.fill(
              child: SplashAnimatedSmokeLayer(animation: _smokeController),
            ),
          ],
        ),
      ),
    );
  }
}
