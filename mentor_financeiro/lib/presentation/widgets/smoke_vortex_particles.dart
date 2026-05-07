import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Visual da camada de fumaça (splash premium imersiva vs. backdrop global claro).
enum SmokeAppearance {
  /// Nevoeiro claro / acinzentado (ex.: [MentorAppBackdrop]).
  lightVortex,

  /// Fumo denso escuro por cima da marca (logo “imersa”).
  denseDarkImmersive,
}

/// Camada de fumaça / vórtice nativa: círculos com desfoque, movimento orbital lento.
class SmokeVortexPainter extends CustomPainter {
  SmokeVortexPainter({
    required this.animationValue,
    this.accentTint,
    this.seed = 7101,
    this.appearance = SmokeAppearance.lightVortex,
  });

  final double animationValue;
  final Color? accentTint;
  final int seed;
  final SmokeAppearance appearance;

  static const int _ambientBlobCount = 14;
  static const int _swirlParticleCount = 96;

  Color _lightSmoke(double alpha, {double tintMix = 0.08}) {
    final base = const Color(0xFFE8EAED);
    if (accentTint == null) return base.withValues(alpha: alpha);
    return Color.lerp(base, accentTint!, tintMix)!.withValues(alpha: alpha);
  }

  Color _darkSmoke(double alpha, {double accentMix = 0.1}) {
    final ink = Color.lerp(
      Colors.black,
      accentTint ?? Colors.black,
      accentMix.clamp(0.0, 0.22),
    )!;
    return ink.withValues(alpha: alpha);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final rnd = math.Random(seed);
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final shortest = size.shortestSide;

    final drift = animationValue * math.pi * 2 * 0.42;

    final isDark = appearance == SmokeAppearance.denseDarkImmersive;
    final swirlTintMix = accentTint == null ? 0.09 : 0.38;

    // Nevoeiro largo.
    for (var i = 0; i < _ambientBlobCount; i++) {
      final bx = rnd.nextDouble() * size.width;
      final by = rnd.nextDouble() * size.height;
      final br = shortest * (0.22 + rnd.nextDouble() * 0.42);
      final sway =
          math.sin(drift * 1.1 + i * 0.7 + rnd.nextDouble() * math.pi * 2) *
              shortest *
              0.03;

      late final Paint ambientPaint;
      if (isDark) {
        final a = 0.14 + rnd.nextDouble() * 0.18;
        ambientPaint = Paint()
          ..color = _darkSmoke(a, accentMix: 0.06)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 56);
      } else {
        ambientPaint = Paint()
          ..color =
              _lightSmoke(0.045 + rnd.nextDouble() * 0.035, tintMix: 0.06)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 52);
      }
      canvas.drawCircle(Offset(bx + sway, by), br, ambientPaint);
    }

    final rnd2 = math.Random(seed + 333);
    for (var i = 0; i < _swirlParticleCount; i++) {
      final phase = rnd2.nextDouble();
      final arm = rnd2.nextDouble();
      final baseAngle = rnd2.nextDouble() * math.pi * 2;

      final turnSpeed = 0.62 + rnd2.nextDouble() * 0.55;
      final angle =
          baseAngle + animationValue * math.pi * 2 * turnSpeed + drift * 0.85;

      final maxReach = shortest * 0.82;
      final dist = arm * maxReach * (0.55 + 0.45 * rnd2.nextDouble());
      final breathe =
          math.sin(animationValue * math.pi * 2 * 2.4 + phase * 11) *
              shortest *
              0.018;

      final ox =
          math.cos(angle + breathe * 0.06) * (dist + breathe) +
              math.sin(drift + phase * 5) * shortest * 0.012;
      final oy =
          math.sin(angle - breathe * 0.04) * (dist + breathe * 0.85) +
              math.cos(drift * 0.9 + phase * 4) * shortest * 0.011;

      final px = (cx + ox).clamp(0.0, size.width);
      final py = (cy + oy).clamp(0.0, size.height);

      final radius =
          lerpDouble(3.2, 18.0, math.pow(arm, 0.82).toDouble())! +
              rnd2.nextDouble() * 4;

      late final Paint p;
      if (isDark) {
        final alpha =
            lerpDouble(0.07, 0.38, arm)! * (0.82 + 0.18 * phase);
        final blurSigma = lerpDouble(6.0, 22.0, arm)!;
        p = Paint()
          ..color = _darkSmoke(alpha, accentMix: 0.14)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
      } else {
        final alpha =
            lerpDouble(0.05, 0.22, arm)! * (0.75 + 0.25 * phase);
        final blurSigma = lerpDouble(5.0, 14.0, arm)!;
        p = Paint()
          ..color = _lightSmoke(alpha, tintMix: swirlTintMix)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
      }
      canvas.drawCircle(Offset(px, py), radius, p);
    }
  }

  @override
  bool shouldRepaint(covariant SmokeVortexPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue ||
      oldDelegate.accentTint != accentTint ||
      oldDelegate.seed != seed ||
      oldDelegate.appearance != appearance;
}
