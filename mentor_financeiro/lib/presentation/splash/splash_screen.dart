import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_routes.dart';
import '../../core/navigation/mentor_navigator.dart';
import '../../services/app_theme_controller.dart';
import '../../services/currency_preference_controller.dart';
import '../../services/firebase_service.dart';
import '../../services/regional_context_controller.dart';
import '../../services/theme_controller.dart';
import '../../services/user_persona_service.dart';

import '../../theme/theme_brand_assets.dart';

/// Tempo mínimo que a arte DevVoid fica visível antes de navegar (produto).
const Duration _kSplashMinimumOnScreen = Duration(seconds: 10);

/// Limite para o conjunto de inicializações em paralelo (evita bloqueio eterno).
const Duration _kSplashInitParallelCap = Duration(seconds: 10);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _smokeController;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    _smokeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _progressController = AnimationController(
      vsync: this,
      duration: _kSplashMinimumOnScreen,
    )..forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      precacheImage(const AssetImage(ThemeBrandAssets.logoSplash), context);
      unawaited(_carregarTudoEMover());
    });
  }

  @override
  void dispose() {
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
    _smokeController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _carregarTudoEMover() async {
    final watch = Stopwatch()..start();
    final user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic>? dados;

    try {
      final regional = context.read<RegionalContextController>();
      final futures = <Future<void>>[
        ThemeController.instance.initialize(),
        AppThemeController.instance.initialize(),
        regional.initialize(),
        UserPersonaService.instance.initialize(),
        CurrencyPreferenceController.instance.initialize(),
      ];

      if (user != null) {
        futures.add(
          FirebaseService.buscarDadosUsuario(user.uid)
              .timeout(const Duration(seconds: 12))
              .then((d) => dados = d),
        );
      }

      await Future.wait(futures).timeout(_kSplashInitParallelCap);
    } catch (e) {
      debugPrint('Splash init (timeout ou erro): $e');
      if (user != null && dados == null) {
        try {
          dados = await FirebaseService.buscarDadosUsuario(user.uid).timeout(
                const Duration(seconds: 12),
              );
        } catch (_) {}
      }
    }

    final remainingMs =
        _kSplashMinimumOnScreen.inMilliseconds - watch.elapsedMilliseconds;
    if (remainingMs > 0) {
      await Future<void>.delayed(Duration(milliseconds: remainingMs));
    }

    if (!mounted) return;
    if (_progressController.value < 1.0) {
      await _progressController.forward();
    }
    if (!mounted) return;
    _navigateWith(user, dados);
  }

  void _pushReplacementNamed(String routeName) {
    final nav = mentorNavigatorKey.currentState;
    if (nav != null) {
      nav.pushReplacementNamed(routeName);
      return;
    }
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  void _navigateWith(User? user, Map<String, dynamic>? dados) {
    if (user == null) {
      _pushReplacementNamed(AppRoutes.login);
      return;
    }
    if (dados != null) {
      if (!(dados['perfilCompleto'] ?? false)) {
        _pushReplacementNamed(AppRoutes.questionario);
        return;
      }
      if (!(dados['onboardingCompleto'] ?? false)) {
        _pushReplacementNamed(AppRoutes.onboardingMentor);
        return;
      }
    }
    _pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                ThemeBrandAssets.logoSplash,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) =>
                    const ColoredBox(color: Colors.black),
              ),
            ),
            // Logo dominante: preenche verticalmente (sem distorcer; pode recortar laterais).
            Positioned.fill(
              child: Image.asset(
                ThemeBrandAssets.logoSplash,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                gaplessPlayback: true,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: SplashForegroundSmokeParticlesPainter(
                    animation: _smokeController,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 20 + bottomInset,
              child: AnimatedBuilder(
                animation: _progressController,
                builder: (context, child) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: _progressController.value.clamp(0.0, 1.0),
                      minHeight: 4,
                      backgroundColor: Colors.white.withValues(alpha: 0.12),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFE5E7EB),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Partículas pretas + fumaça densa **por cima da logo** (imersão).
class SplashForegroundSmokeParticlesPainter extends CustomPainter {
  SplashForegroundSmokeParticlesPainter({required this.animation})
      : super(repaint: animation);

  final Animation<double> animation;

  static const int _particleCount = 76;
  static const int _smokeBlobCount = 22;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;
    final t = animation.value;
    final shortest = size.shortestSide;

    // Fumaça: densa, mas sem “apagar” a arte
    final rndSmoke = math.Random(9001);
    for (var i = 0; i < _smokeBlobCount; i++) {
      final phase = rndSmoke.nextDouble();
      final bx = rndSmoke.nextDouble() * size.width;
      final by = rndSmoke.nextDouble() * size.height;
      final br = shortest * (0.14 + rndSmoke.nextDouble() * 0.34);
      final sway = math.sin(t * math.pi * 2 + phase * 6) * shortest * 0.04;
      final a = 0.12 + rndSmoke.nextDouble() * 0.18;
      final paint = Paint()
        ..color = Colors.black.withValues(alpha: a)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 44);
      canvas.drawCircle(Offset(bx + sway, by), br, paint);
    }

    // Partículas: grãos visíveis, mas equilibrados
    final rndP = math.Random(1337);
    for (var i = 0; i < _particleCount; i++) {
      final seed = rndP.nextDouble();
      final baseX = rndP.nextDouble() * size.width;
      final baseY = rndP.nextDouble() * size.height;
      final driftX = math.sin(t * math.pi * 2 * 1.3 + seed * 12) * 14;
      final driftY = math.cos(t * math.pi * 2 * 0.9 + seed * 9) * 11 -
          t * 18 * (0.3 + seed * 0.7);
      final px = (baseX + driftX) % size.width;
      final py = (baseY + driftY) % size.height;
      final r = lerpDouble(1.6, 4.8, rndP.nextDouble())!;
      // Partículas mais escuras/intensas (pedido: “no máximo”), sem escurecer a arte.
      final alpha = 0.45 + rndP.nextDouble() * 0.50;
      final blur = lerpDouble(0.0, 4.5, rndP.nextDouble())!;
      final p = Paint()..color = Colors.black.withValues(alpha: alpha);
      if (blur > 0.5) {
        p.maskFilter = MaskFilter.blur(BlurStyle.normal, blur);
      }
      canvas.drawCircle(Offset(px, py), r, p);
    }
  }

  @override
  bool shouldRepaint(covariant SplashForegroundSmokeParticlesPainter oldDelegate) =>
      true;
}
