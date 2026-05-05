import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../core/constants/app_routes.dart';
import '../services/user_persona_service.dart';
import 'mentor_tour_keys.dart';

/// Liga os passos Home → Calculadora e finaliza o tour no último showcase.
class MentorTourCoordinator {
  MentorTourCoordinator._();

  static void onShowcaseStepCompleted(GlobalKey? key, GlobalKey<NavigatorState> navigatorKey) {
    if (key == MentorTourKeys.homeCalculadora) {
      final ctx = navigatorKey.currentContext;
      if (ctx == null) return;
      Navigator.of(ctx).pushNamed(AppRoutes.calculadoraMentora);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ShowcaseView.get().startShowCase(<GlobalKey>[
            MentorTourKeys.personaSelector,
            MentorTourKeys.calculateSave,
            MentorTourKeys.wealthChart,
          ]);
        });
      });
      return;
    }
    if (key == MentorTourKeys.wealthChart) {
      UserPersonaService.instance.completeGuidedTour();
    }
  }

  static void skipTour() {
    ShowcaseView.get().dismiss();
    UserPersonaService.instance.completeGuidedTour();
  }
}
