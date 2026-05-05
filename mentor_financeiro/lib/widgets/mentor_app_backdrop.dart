import 'package:flutter/material.dart';

import '../services/app_theme_controller.dart';

/// Fundo global por tema predefinido (sem imagem do utilizador).
/// Preset Void: bruma ciano muito subtil sobre preto.
class MentorAppBackdrop extends StatelessWidget {
  const MentorAppBackdrop({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppThemeController.instance,
      builder: (context, _) {
        final c = AppThemeController.instance;

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(child: ColoredBox(color: c.backdropBaseColor)),
            if (c.themeMode == AppThemeMode.voidTheme)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0, 0.72),
                      radius: 1.15,
                      colors: [
                        const Color(0xFF00E5FF).withValues(alpha: 0.07),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            if (c.themeMode == AppThemeMode.cyber)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFD946EF).withValues(alpha: 0.06),
                        Colors.transparent,
                        const Color(0xFF7C3AED).withValues(alpha: 0.05),
                      ],
                    ),
                  ),
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
