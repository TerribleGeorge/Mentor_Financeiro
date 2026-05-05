import 'package:flutter/material.dart';

import '../../app/mentor_app_router.dart';

/// Substitui a rota atual por uma rota nomeada com transição em fade.
Future<void> pushReplacementNamedFade(
  BuildContext context,
  String name, {
  Object? arguments,
}) {
  final settings = RouteSettings(name: name, arguments: arguments);
  final generated = MentorAppRouter.onGenerateRoute(settings);
  if (generated == null) {
    return Future.value();
  }
  final route = generated as MaterialPageRoute<void>;
  final page = route.builder(context);
  return Navigator.of(context).pushReplacement<void, void>(
    PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 420),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
  );
}
