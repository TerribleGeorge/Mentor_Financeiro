import 'dart:io';

import 'package:flutter/material.dart';

import '../services/app_theme_controller.dart';

/// Coloca a imagem de fundo abaixo de toda a árvore de rotas; o [Container] sólido
/// cobre o ecrã quando não há foto (Scaffold fica `transparent` no tema).
class MentorAppBackdrop extends StatelessWidget {
  const MentorAppBackdrop({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppThemeController.instance,
      builder: (context, _) {
        final c = AppThemeController.instance;
        final bgPath = c.backgroundImagePath;

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: ColoredBox(color: c.backdropBaseColor),
            ),
            if (bgPath != null && File(bgPath).existsSync())
              Positioned.fill(
                child: Image.file(
                  File(bgPath),
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                  errorBuilder: (context, err, st) {
                    debugPrint('MentorAppBackdrop Image.file: $err');
                    return const SizedBox.shrink();
                  },
                ),
              ),
            Positioned.fill(
              child: child ?? const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
