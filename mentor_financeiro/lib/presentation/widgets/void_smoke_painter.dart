import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Partículas de "fumaça" do Abismo: orbes radiais que sobem com movimento orgânico.
class VoidSmokePainter extends CustomPainter {
  VoidSmokePainter({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  static const Color _lead = Color(0xFF1A1A1A);
  static const int _particleCount = 15;

  double _fract(double x) => x - x.floorToDouble();

  double _rand(double seed) => _fract(math.sin(seed) * 43758.5453123);

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final t = animation.value;
    final orbs = <_SmokeOrb>[];

    for (var i = 0; i < _particleCount; i++) {
      final si = i.toDouble();
      final rX = _rand(si * 12.9898);
      final rSpeed = 0.22 + _rand(si * 78.233 + 1) * 0.78;
      final rSize = 14 + _rand(si * 45.164 + 2) * 52;
      final baseOpacity = 0.2 + _rand(si * 93.989 + 3) * 0.3;
      final phaseShift = _rand(si * 67.41 + 4);
      final driftFreq = 0.4 + _rand(si * 31.7 + 5) * 1.4;
      final driftAmp = 10 + _rand(si * 22.1 + 6) * 28;

      var phase = (phaseShift + t * rSpeed) % 1.0;
      phase = Curves.easeInOut.transform(phase);

      final travel = size.height * 1.15 + rSize * 2;
      final y = size.height + rSize - phase * travel;

      final drift = math.sin(t * math.pi * 2 * driftFreq + si * 0.73) * driftAmp;
      final x = rX * size.width + drift;

      final wobble = Curves.easeInOut.transform(_fract(t * 0.15 + si * 0.02));
      final opacity =
          (baseOpacity * (0.75 + 0.25 * math.sin(wobble * math.pi))).clamp(0.2, 0.5);

      final greyMix = _rand(si * 88.1 + 7);

      orbs.add(
        _SmokeOrb(
          center: Offset(x, y),
          radius: rSize,
          opacity: opacity,
          greyMix: greyMix,
        ),
      );
    }

    orbs.sort((a, b) => b.radius.compareTo(a.radius));

    for (final orb in orbs) {
      final center = orb.center;
      final rSize = orb.radius;
      final opacity = orb.opacity;

      if (center.dy < -rSize ||
          center.dy > size.height + rSize * 2 ||
          center.dx < -rSize ||
          center.dx > size.width + rSize) {
        continue;
      }

      final core = Color.lerp(Colors.black, _lead, orb.greyMix)!;

      final rect = Rect.fromCircle(center: center, radius: rSize);
      final shader = RadialGradient(
        colors: [
          core.withValues(alpha: opacity * 0.95),
          Color.lerp(Colors.black, _lead, orb.greyMix * 0.6)!
              .withValues(alpha: opacity * 0.45),
          Colors.transparent,
        ],
        stops: const [0.0, 0.48, 1.0],
      ).createShader(rect);

      canvas.drawCircle(center, rSize, Paint()..shader = shader);
    }
  }

  @override
  bool shouldRepaint(covariant VoidSmokePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}

class _SmokeOrb {
  _SmokeOrb({
    required this.center,
    required this.radius,
    required this.opacity,
    required this.greyMix,
  });

  final Offset center;
  final double radius;
  final double opacity;
  final double greyMix;
}
