import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/mentor_adaptive_visuals.dart';

/// Blur leve por trás do conteúdo para leitura estável com fotos “ruidosas”.
class MentorReadableLayer extends StatelessWidget {
  const MentorReadableLayer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final sigma = context.mentorAdaptive.readableBlurSigma;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: ColoredBox(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}
