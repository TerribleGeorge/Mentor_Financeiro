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
