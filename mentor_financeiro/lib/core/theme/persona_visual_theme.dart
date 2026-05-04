import 'package:flutter/material.dart';

import '../../domain/entities/user_persona.dart';

/// Paleta leve por perfil do Mentor.
class PersonaVisualTheme {
  const PersonaVisualTheme({
    required this.accent,
    required this.onAccent,
    required this.chartInterestColors,
    required this.mentorBorder,
    required this.mentorGradStart,
    required this.mentorGradEnd,
    required this.insightIconColor,
  });

  final Color accent;
  final Color onAccent;
  final List<Color> chartInterestColors;
  final Color mentorBorder;
  final Color mentorGradStart;
  final Color mentorGradEnd;
  final Color insightIconColor;

  static PersonaVisualTheme forPersona(UserPersona persona) {
    switch (persona) {
      case UserPersona.conservative:
        return const PersonaVisualTheme(
          accent: Color(0xFF5EEAD4),
          onAccent: Color(0xFF0F172A),
          chartInterestColors: [Color(0xFF0F766E), Color(0xFF2DD4BF)],
          mentorBorder: Color(0xFF5EEAD4),
          mentorGradStart: Color(0xFF134E4A),
          mentorGradEnd: Color(0xFF0F172A),
          insightIconColor: Color(0xFF99F6E4),
        );
      case UserPersona.strategist:
        return const PersonaVisualTheme(
          accent: Color(0xFF818CF8),
          onAccent: Color(0xFF0F172A),
          chartInterestColors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
          mentorBorder: Color(0xFFA5B4FC),
          mentorGradStart: Color(0xFF312E81),
          mentorGradEnd: Color(0xFF0F172A),
          insightIconColor: Color(0xFFC7D2FE),
        );
      case UserPersona.riskTaker:
        return const PersonaVisualTheme(
          accent: Color(0xFFFF6B9D),
          onAccent: Color(0xFF1A0508),
          chartInterestColors: [Color(0xFFFF8E53), Color(0xFFFF3377)],
          mentorBorder: Color(0xFFFF8FAB),
          mentorGradStart: Color(0xFF7F1D1D),
          mentorGradEnd: Color(0xFF1E1B4B),
          insightIconColor: Color(0xFFFFE066),
        );
      case UserPersona.novice:
        return const PersonaVisualTheme(
          accent: Color(0xFF00D9FF),
          onAccent: Color(0xFF0F172A),
          chartInterestColors: [Color(0xFF00D9FF), Color(0xFF3B82F6)],
          mentorBorder: Color(0xFF00D9FF),
          mentorGradStart: Color(0xFF0E7490),
          mentorGradEnd: Color(0xFF1E1B4B),
          insightIconColor: Color(0xFFFDE68A),
        );
    }
  }
}
