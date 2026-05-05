import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

/// Estética devvoid: fundo escuro, contorno ciano, texto claro.
class MentorShowcaseStyle {
  MentorShowcaseStyle._();

  static const Color _panel = Color(0xFF0F172A);
  static const Color _cyan = Color(0xFF00D9FF);

  static ShapeBorder get targetBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: _cyan, width: 1.5),
      );

  static Showcase wrap({
    required GlobalKey showcaseKey,
    required String description,
    required Widget child,
    String title = '',
  }) {
    return Showcase(
      key: showcaseKey,
      title: title.isEmpty ? null : title,
      description: description,
      tooltipBackgroundColor: _panel,
      textColor: Colors.white,
      descTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        height: 1.35,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      tooltipBorderRadius: BorderRadius.circular(12),
      targetShapeBorder: targetBorder,
      overlayOpacity: 0.82,
      child: child,
    );
  }
}
