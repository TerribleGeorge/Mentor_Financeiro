import 'package:flutter/material.dart';

/// Cores e parâmetros visuais adaptados ao fundo (extração + contraste).
@immutable
class MentorAdaptiveVisuals extends ThemeExtension<MentorAdaptiveVisuals> {
  const MentorAdaptiveVisuals({
    required this.textColor,
    required this.secondaryTextColor,
    required this.widgetColor,
    required this.readableBlurSigma,
  });

  /// Texto principal — alto contraste vs luminância do fundo.
  final Color textColor;

  /// Texto secundário (legendas, hints).
  final Color secondaryTextColor;

  /// Vidro para Cards/Containers (ARGB já com alpha na tinta).
  final Color widgetColor;

  /// Sigma do blur atrás de áreas de leitura ([MentorReadableLayer]).
  final double readableBlurSigma;

  static const MentorAdaptiveVisuals darkNeutral = MentorAdaptiveVisuals(
    textColor: Colors.white,
    secondaryTextColor: Color(0xB3FFFFFF),
    widgetColor: Color(0x33FFFFFF),
    readableBlurSigma: 5,
  );

  static const MentorAdaptiveVisuals lightNeutral = MentorAdaptiveVisuals(
    textColor: Color(0xEE000000),
    secondaryTextColor: Color(0x99000000),
    widgetColor: Color(0x33000000),
    readableBlurSigma: 5,
  );

  /// Preto puro, ciano, vidro com traço ciano (preset Void).
  static const MentorAdaptiveVisuals presetVoid = MentorAdaptiveVisuals(
    textColor: Color(0xFFE8FDFF),
    secondaryTextColor: Color(0xB300E5FF),
    widgetColor: Color(0x2800E5FF),
    readableBlurSigma: 6,
  );

  /// Cyber: vidro escuro, roxo neon.
  static const MentorAdaptiveVisuals presetCyber = MentorAdaptiveVisuals(
    textColor: Color(0xFFF5E8FF),
    secondaryTextColor: Color(0xB3E879F9),
    widgetColor: Color(0x2AE879F9),
    readableBlurSigma: 6,
  );

  /// Obsidian: cinza chumbo, prata.
  static const MentorAdaptiveVisuals presetObsidian = MentorAdaptiveVisuals(
    textColor: Color(0xFFF1F3F5),
    secondaryTextColor: Color(0xB3C0C5CE),
    widgetColor: Color(0x33C0C5CE),
    readableBlurSigma: 5,
  );

  /// Glacier: claro, azul gelo, alto contraste.
  static const MentorAdaptiveVisuals presetGlacier = MentorAdaptiveVisuals(
    textColor: Color(0xFF0A1628),
    secondaryTextColor: Color(0xB31E3A5F),
    widgetColor: Color(0x330EA5E9),
    readableBlurSigma: 5,
  );

  @override
  MentorAdaptiveVisuals copyWith({
    Color? textColor,
    Color? secondaryTextColor,
    Color? widgetColor,
    double? readableBlurSigma,
  }) {
    return MentorAdaptiveVisuals(
      textColor: textColor ?? this.textColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      widgetColor: widgetColor ?? this.widgetColor,
      readableBlurSigma: readableBlurSigma ?? this.readableBlurSigma,
    );
  }

  @override
  MentorAdaptiveVisuals lerp(ThemeExtension<MentorAdaptiveVisuals>? other, double t) {
    if (other is! MentorAdaptiveVisuals) {
      return this;
    }
    return MentorAdaptiveVisuals(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      widgetColor: Color.lerp(widgetColor, other.widgetColor, t)!,
      readableBlurSigma: readableBlurSigma + (other.readableBlurSigma - readableBlurSigma) * t,
    );
  }
}

extension MentorAdaptiveVisualsX on BuildContext {
  MentorAdaptiveVisuals get mentorAdaptive =>
      Theme.of(this).extension<MentorAdaptiveVisuals>() ?? MentorAdaptiveVisuals.darkNeutral;
}
