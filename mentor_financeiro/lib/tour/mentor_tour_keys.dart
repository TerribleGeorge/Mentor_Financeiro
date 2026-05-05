import 'package:flutter/material.dart';

/// GlobalKeys partilhadas entre rotas dentro do mesmo [ShowCaseWidget].
abstract final class MentorTourKeys {
  static final GlobalKey homeCalculadora = GlobalKey();
  static final GlobalKey personaSelector = GlobalKey();
  static final GlobalKey calculateSave = GlobalKey();
  static final GlobalKey wealthChart = GlobalKey();
}
