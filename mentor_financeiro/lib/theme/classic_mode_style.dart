import 'package:flutter/material.dart';

/// Legibilidade no Modo Clássico (`pages/`): sombras em títulos sobre fundos dinâmicos.
abstract final class ClassicModeStyle {
  static List<Shadow> primaryTextShadows(BuildContext context) {
    final bright = Theme.of(context).brightness == Brightness.light;
    if (bright) {
      return [
        Shadow(
          color: Colors.white.withValues(alpha: 0.95),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
        Shadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.28),
          blurRadius: 14,
          offset: const Offset(0, 2),
        ),
      ];
    }
    return [
      Shadow(
        color: Colors.black.withValues(alpha: 0.88),
        blurRadius: 14,
        offset: const Offset(0, 2),
      ),
      Shadow(
        color: const Color(0xFF00D9FF).withValues(alpha: 0.22),
        blurRadius: 16,
      ),
    ];
  }

  static List<Shadow> secondaryTextShadows(BuildContext context) {
    final bright = Theme.of(context).brightness == Brightness.light;
    if (bright) {
      return [
        Shadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.18),
          blurRadius: 10,
        ),
      ];
    }
    return [
      Shadow(
        color: Colors.black.withValues(alpha: 0.78),
        blurRadius: 10,
      ),
    ];
  }

  /// Sombras suaves em valores monetários (R\$, formatCurrency) sobre qualquer tema.
  static List<Shadow> financialValueShadows(BuildContext context) {
    final bright = Theme.of(context).brightness == Brightness.light;
    if (bright) {
      return [
        Shadow(
          color: Colors.white.withValues(alpha: 0.88),
          blurRadius: 3,
          offset: const Offset(0, 0.5),
        ),
        Shadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.2),
          blurRadius: 8,
          offset: const Offset(0, 1.5),
        ),
      ];
    }
    return [
      Shadow(
        color: Colors.black.withValues(alpha: 0.72),
        blurRadius: 12,
        offset: const Offset(0, 2),
      ),
      Shadow(
        color: Colors.black.withValues(alpha: 0.35),
        blurRadius: 5,
        offset: const Offset(0, 1),
      ),
    ];
  }
}

/// Extensão para aplicar legibilidade em texto de valores financeiros.
extension FinancialLegibilityTextStyle on TextStyle {
  TextStyle withFinancialShadows(BuildContext context) =>
      copyWith(shadows: ClassicModeStyle.financialValueShadows(context));
}
