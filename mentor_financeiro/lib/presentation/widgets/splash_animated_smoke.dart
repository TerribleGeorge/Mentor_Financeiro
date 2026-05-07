import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Fumaça densa escura por gradientes animados (camada superior da splash).
class SplashAnimatedSmokeLayer extends StatelessWidget {
  const SplashAnimatedSmokeLayer({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return CustomPaint(
            painter: _SplashSmokePainter(animation.value),
          );
        },
      ),
    );
  }
}

class _SplashSmokePainter extends CustomPainter {
  _SplashSmokePainter(this.t);
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;
    final rect = Offset.zero & size;
    final phase = t * math.pi * 2;
    final sx = math.sin(phase * 0.85);
    final cx = math.cos(phase * 0.62);

    final start = Offset(size.width * (0.12 + sx * 0.14), -size.height * 0.05);
    final end = Offset(
      size.width * (0.92 - sx * 0.1),
      size.height * 1.08,
    );

    final g1 = ui.Gradient.linear(
      start,
      end,
      const [
        Color(0xD9000000),
        Color(0x92000000),
        Color(0xB8000000),
        Color(0x70000000),
      ],
      [
        0.0,
        (0.38 + cx * 0.05).clamp(0.05, 0.92),
        (0.62 - sx * 0.04).clamp(0.08, 0.95),
        1.0,
      ],
    );

    canvas.drawRect(rect, Paint()..shader = g1);

    final center = Offset(
      size.width * (0.48 + cx * 0.22),
      size.height * (0.38 + sx * 0.18),
    );
    final rg = ui.Gradient.radial(
      center,
      size.shortestSide * (0.85 + sx.abs() * 0.12),
      const [
        Color(0xA8000000),
        Color(0x59000000),
        Color(0x00000000),
      ],
      const [0.0, 0.42, 1.0],
    );

    canvas.drawRect(
      rect,
      Paint()
        ..shader = rg
        ..blendMode = BlendMode.multiply,
    );

    final g2 = ui.Gradient.linear(
      Offset(size.width * 1.02, size.height * (0.15 + cx * 0.12)),
      Offset(-size.width * 0.02, size.height * (0.92 + sx * 0.04)),
      const [
        Color(0x82000000),
        Color(0x48000000),
        Color(0x76000000),
      ],
      const [0.0, 0.52, 1.0],
    );

    canvas.drawRect(
      rect,
      Paint()
        ..shader = g2
        ..blendMode = BlendMode.softLight,
    );
  }

  @override
  bool shouldRepaint(covariant _SplashSmokePainter oldDelegate) =>
      oldDelegate.t != t;
}
