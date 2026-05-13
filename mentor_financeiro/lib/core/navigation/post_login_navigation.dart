import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/main_navigation.dart';
import '../../presentation/intro/intro_tour_screen.dart';

/// Após questionário / onboarding legado: mesmo critério do login — intro ou home principal.
Future<void> mentorReplaceWithIntroOrMain(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final introDone = prefs.getBool(kIntroMentorTourCompletedKey) == true;
  if (!context.mounted) return;
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<void>(
      builder: (_) =>
          introDone ? const MainNavigation() : const IntroTourScreen(),
    ),
    (route) => false,
  );
}
