import 'package:flutter/material.dart';

/// GlobalKeys partilhadas entre rotas dentro do mesmo [ShowCaseWidget].
abstract final class MentorTourKeys {
  /// Ordem do tour na home (de cima para baixo).
  static final GlobalKey homeTourClassicMode = GlobalKey();
  static final GlobalKey homeTourVitrineHeader = GlobalKey();
  static final GlobalKey homeTourProfileSim = GlobalKey();
  static final GlobalKey homeTourStrategies = GlobalKey();
  static final GlobalKey homeTourMentorHub = GlobalKey();
  static final GlobalKey homeTourPremium = GlobalKey();
  static final GlobalKey homeTourMarket = GlobalKey();
  static final GlobalKey homeCalculadora = GlobalKey();

  /// Passos só na home (antes da Calculadora Mentora).
  static List<GlobalKey> get homeTourSequence => <GlobalKey>[
        homeTourClassicMode,
        homeTourVitrineHeader,
        homeTourProfileSim,
        homeTourStrategies,
        homeTourMentorHub,
        homeTourPremium,
        homeTourMarket,
        homeCalculadora,
      ];

  static final GlobalKey personaSelector = GlobalKey();
  static final GlobalKey calculateSave = GlobalKey();
  static final GlobalKey wealthChart = GlobalKey();
}
