import 'package:flutter/material.dart';

import '../../services/app_theme_controller.dart';

/// Escolhe a arte da splash com base no entitlement RevenueCat e no tema guardado.
abstract final class SplashAssetResolver {
  /// Logo DevVoid (fundo transparente).
  static const String devVoidLogo = 'assets/images/DevVoid_logo.png';
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
      // Splash: nunca usar devvoid_standard (asset com barra/proporção errada).
      // Para a Splash, usamos sempre a logo DevVoid transparente e partículas por código.
      return devVoidLogo;
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
    // Splash: sempre a logo DevVoid central (BoxFit.contain) em fundo preto.
    // A diferenciação visual fica nas partículas (cor) e, se quiser, na barra.
    final particles = switch (theme) {
      AppThemeMode.cyber => const Color(0xFF00E5FF),
      AppThemeMode.obsidian => const Color(0xFFFF2D2D),
      AppThemeMode.glacier => const Color(0xFFFFD166),
      AppThemeMode.voidTheme => const Color(0xFF0B0B0B),
    };

    return (
      asset: devVoidLogo,
      background: Colors.black,
      // Barra neutra e elegante; pode ser personalizada depois.
      progress: const Color(0xFFE5E7EB),
      particles: isPremium ? particles : const Color(0xFF0B0B0B),
    );
  }
}
