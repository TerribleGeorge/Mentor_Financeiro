import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../services/mentoria_service.dart';

class NotaSaudeCircle extends StatelessWidget {
  final NotaSaudeFinanceira notaSaude;
  final VoidCallback? onTap;

  const NotaSaudeCircle({super.key, required this.notaSaude, this.onTap});

  Color _getScoreColor() {
    final nota = notaSaude.nota;
    if (nota >= 8) return const Color(0xFF26DE81);
    if (nota >= 6) return const Color(0xFFFECA57);
    if (nota >= 4) return const Color(0xFFFF9F43);
    return const Color(0xFFFC5C65);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF1E293B),
          boxShadow: [
            BoxShadow(
              color: _getScoreColor().withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: CustomPaint(
          painter: _CircleProgressPainter(
            progress: notaSaude.nota / 10,
            color: _getScoreColor(),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  notaSaude.nota.toStringAsFixed(1),
                  style: TextStyle(
                    color: _getScoreColor(),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '/10',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  _CircleProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;

    final backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircleProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

class NotaSaudeCard extends StatelessWidget {
  final NotaSaudeFinanceira notaSaude;

  const NotaSaudeCard({super.key, required this.notaSaude});

  Color _getScoreColor() {
    final nota = notaSaude.nota;
    if (nota >= 8) return const Color(0xFF26DE81);
    if (nota >= 6) return const Color(0xFFFECA57);
    if (nota >= 4) return const Color(0xFFFF9F43);
    return const Color(0xFFFC5C65);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _getScoreColor().withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NotaSaudeCircle(notaSaude: notaSaude),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saúde Financeira',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notaSaude.diagnostico,
                      style: TextStyle(
                        color: _getScoreColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (notaSaude.pontosPositivos.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: notaSaude.pontosPositivos.map((ponto) {
                return Chip(
                  label: Text(
                    '+ $ponto',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF26DE81),
                    ),
                  ),
                  backgroundColor: const Color(
                    0xFF26DE81,
                  ).withValues(alpha: 0.15),
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
            ),
          ],
          if (notaSaude.pontosNegativos.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: notaSaude.pontosNegativos.map((ponto) {
                return Chip(
                  label: Text(
                    '- $ponto',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFFC5C65),
                    ),
                  ),
                  backgroundColor: const Color(
                    0xFFFC5C65,
                  ).withValues(alpha: 0.15),
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
