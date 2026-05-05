import 'package:flutter/material.dart';

import '../../services/app_theme_controller.dart';

/// Escolhe a arte da splash com base no entitlement RevenueCat e no tema guardado.
abstract final class SplashAssetResolver {
  /// Logo standard (não-premium) full-bleed.
  static const String devVoidLogo = 'assets/images/DevVoid_logo.png';
  static const String standard = 'assets/images/devvoid_standard.png';
  static const String cyber = 'assets/images/devvoid_cyber.png';
  static const String grimm = 'assets/images/devvoid_grimm.png';
  static const String hive = 'assets/images/devvoid_hive.png';

  /// Premium: Cyber → Grimm → Hive conforme [AppThemeMode]; Void usa standard.
  /// Não premium ou dados inválidos: sempre [standard].
  static String resolve({
    required bool isPremium,
    required AppThemeMode theme,
  }) {
    try {
      if (!isPremium) return devVoidLogo;
      return switch (theme) {
        AppThemeMode.cyber => cyber,
        AppThemeMode.obsidian => grimm,
        AppThemeMode.glacier => hive,
        AppThemeMode.voidTheme => devVoidLogo,
      };
    } catch (_) {
      return devVoidLogo;
    }
  }

  /// Retorna branding completo (asset + fundo + cor da barra).
  ///
  /// - Não-premium: sempre [devVoidLogo] em fundo preto, barra metálica/branca.
  /// - Premium: logo por tema + cores do tema.
  static ({String asset, Color background, Color progress, Color particles})
      resolveBranding({
    required bool isPremium,
    required AppThemeMode theme,
  }) {
    if (!isPremium) {
      return (
        asset: devVoidLogo,
        background: Colors.black,
        progress: const Color(0xFFE5E7EB), // cinza metálico/branco
        particles: const Color(0xFF0B0B0B), // névoa negra/cinza escura
      );
    }

    return switch (theme) {
      AppThemeMode.cyber => (
          asset: cyber,
          background: const Color(0xFF070014),
          progress: const Color(0xFFE879F9),
          particles: const Color(0xFF00E5FF), // ciano neon
        ),
      // Grimm
      AppThemeMode.obsidian => (
          asset: grimm,
          background: const Color(0xFF140607),
          progress: const Color(0xFFFF3B30),
          particles: const Color(0xFFFF2D2D), // escarlate
        ),
      // Hive
      AppThemeMode.glacier => (
          asset: hive,
          background: const Color(0xFF0B0A06),
          progress: const Color(0xFFFFD166),
          particles: const Color(0xFFFFD166), // dourado
        ),
      AppThemeMode.voidTheme => (
          asset: devVoidLogo,
          background: Colors.black,
          progress: const Color(0xFFE5E7EB),
          particles: const Color(0xFF0B0B0B),
        ),
    };
  }
}
