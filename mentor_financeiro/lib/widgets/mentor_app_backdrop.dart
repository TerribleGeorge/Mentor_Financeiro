import 'dart:ui';

import 'package:flutter/material.dart';

import '../services/app_theme_controller.dart';

/// Fundo global: imagem → blur (glass) → gradientes por tema → conteúdo.
class MentorAppBackdrop extends StatelessWidget {
  const MentorAppBackdrop({super.key, required this.child});

  final Widget? child;

  static const String _voidBgAsset = 'assets/images/devvoid_logo.png';
  static const String _cyberBgAsset = 'assets/images/bg_cyber.png';

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
            Positioned.fill(child: _ThemeBackgroundLayer(themeMode: c.themeMode)),
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: Container(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ),
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
            if (c.themeMode == AppThemeMode.obsidian)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: 1.2,
                      colors: [
                        Colors.black.withValues(alpha: 0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            if (c.themeMode == AppThemeMode.glacier)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.35),
                        const Color(0xFFF0F9FF).withValues(alpha: 0.02),
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

class _ThemeBackgroundLayer extends StatelessWidget {
  const _ThemeBackgroundLayer({required this.themeMode});

  final AppThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    switch (themeMode) {
      case AppThemeMode.cyber:
        return Image.asset(
          MentorAppBackdrop._cyberBgAsset,
          fit: BoxFit.cover,
          gaplessPlayback: true,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        );
      case AppThemeMode.voidTheme:
      case AppThemeMode.obsidian:
        return Opacity(
          opacity: themeMode == AppThemeMode.obsidian ? 0.14 : 0.22,
          child: Image.asset(
            MentorAppBackdrop._voidBgAsset,
            fit: BoxFit.cover,
            gaplessPlayback: true,
            errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
          ),
        );
      case AppThemeMode.glacier:
        return const SizedBox.shrink();
    }
  }
}
