import 'package:flutter/material.dart';

/// Cores e parâmetros visuais por preset (Void / Cyber / Grimm / Hive).
@immutable
class MentorAdaptiveVisuals extends ThemeExtension<MentorAdaptiveVisuals> {
  const MentorAdaptiveVisuals({
    required this.textColor,
    required this.secondaryTextColor,
    required this.widgetColor,
    required this.readableBlurSigma,
    required this.accentNeon,
  });

  final Color textColor;
  final Color secondaryTextColor;
  final Color widgetColor;
  final double readableBlurSigma;
  /// Cor de destaque (neon) por preset — primária em botões, brilho no texto.
  final Color accentNeon;

  static const MentorAdaptiveVisuals darkNeutral = MentorAdaptiveVisuals(
    textColor: Colors.white,
    secondaryTextColor: Color(0xB3FFFFFF),
    widgetColor: Color(0x33FFFFFF),
    readableBlurSigma: 5,
    accentNeon: Color(0xFF80D8FF),
  );

  static const MentorAdaptiveVisuals lightNeutral = MentorAdaptiveVisuals(
    textColor: Color(0xEE000000),
    secondaryTextColor: Color(0x99000000),
    widgetColor: Color(0x33000000),
    readableBlurSigma: 5,
    accentNeon: Color(0xFF0288D1),
  );

  /// Void: principal + branding app_icon2 — ciano sobre preto.
  static const MentorAdaptiveVisuals presetVoid = MentorAdaptiveVisuals(
    textColor: Color(0xFFE8FDFF),
    secondaryTextColor: Color(0xB300E5FF),
    widgetColor: Color(0x2800E5FF),
    readableBlurSigma: 6,
    accentNeon: Color(0xFF00E5FF),
  );

  /// Cyber: amarelo neon + cinza escuro.
  static const MentorAdaptiveVisuals presetCyber = MentorAdaptiveVisuals(
    textColor: Color(0xFFFFFDE7),
    secondaryTextColor: Color(0xB3FFEE58),
    widgetColor: Color(0x40212121),
    readableBlurSigma: 6,
    accentNeon: Color(0xFFFFEA00),
  );

  /// Grimm (obsidian): vermelho e preto.
  static const MentorAdaptiveVisuals presetObsidian = MentorAdaptiveVisuals(
    textColor: Color(0xFFFFEBEE),
    secondaryTextColor: Color(0xB3FF5252),
    widgetColor: Color(0x33B71C1C),
    readableBlurSigma: 6,
    accentNeon: Color(0xFFFF1744),
  );

  /// Hive (glacier): laranja e preto — estilo vespa.
  static const MentorAdaptiveVisuals presetGlacier = MentorAdaptiveVisuals(
    textColor: Color(0xFFFFF3E0),
    secondaryTextColor: Color(0xB3FFA726),
    widgetColor: Color(0x33E65100),
    readableBlurSigma: 6,
    accentNeon: Color(0xFFFF6D00),
  );

  /// --- Temas claros (Material light) por preset ---

  static const MentorAdaptiveVisuals presetVoidLight = MentorAdaptiveVisuals(
    textColor: Color(0xFF0A1628),
    secondaryTextColor: Color(0xB301578A),
    widgetColor: Color(0x3300BCD4),
    readableBlurSigma: 5,
    accentNeon: Color(0xFF00ACC1),
  );

  static const MentorAdaptiveVisuals presetCyberLight = MentorAdaptiveVisuals(
    textColor: Color(0xFF212121),
    secondaryTextColor: Color(0xB3F57F17),
    widgetColor: Color(0x33FFEB3B),
    readableBlurSigma: 5,
    accentNeon: Color(0xFFF9A825),
  );

  static const MentorAdaptiveVisuals presetGrimmLight = MentorAdaptiveVisuals(
    textColor: Color(0xFF3E2723),
    secondaryTextColor: Color(0xB3C62828),
    widgetColor: Color(0x33EF5350),
    readableBlurSigma: 5,
    accentNeon: Color(0xFFD32F2F),
  );

  static const MentorAdaptiveVisuals presetHiveLight = MentorAdaptiveVisuals(
    textColor: Color(0xFF3E2723),
    secondaryTextColor: Color(0xB3EF6C00),
    widgetColor: Color(0x33FF9800),
    readableBlurSigma: 5,
    accentNeon: Color(0xFFFF6F00),
  );

  @override
  MentorAdaptiveVisuals copyWith({
    Color? textColor,
    Color? secondaryTextColor,
    Color? widgetColor,
    double? readableBlurSigma,
    Color? accentNeon,
  }) {
    return MentorAdaptiveVisuals(
      textColor: textColor ?? this.textColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      widgetColor: widgetColor ?? this.widgetColor,
      readableBlurSigma: readableBlurSigma ?? this.readableBlurSigma,
      accentNeon: accentNeon ?? this.accentNeon,
    );
  }

  @override
  MentorAdaptiveVisuals lerp(ThemeExtension<MentorAdaptiveVisuals>? other, double t) {
    if (other is! MentorAdaptiveVisuals) {
      return this;
    }
    return MentorAdaptiveVisuals(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      widgetColor: Color.lerp(widgetColor, other.widgetColor, t)!,
      readableBlurSigma:
          readableBlurSigma + (other.readableBlurSigma - readableBlurSigma) * t,
      accentNeon: Color.lerp(accentNeon, other.accentNeon, t)!,
    );
  }
}

extension MentorAdaptiveVisualsX on BuildContext {
  MentorAdaptiveVisuals get mentorAdaptive =>
      Theme.of(this).extension<MentorAdaptiveVisuals>() ??
      MentorAdaptiveVisuals.darkNeutral;
}
