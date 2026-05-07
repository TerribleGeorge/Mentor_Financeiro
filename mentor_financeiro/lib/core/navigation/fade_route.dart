import 'package:flutter/material.dart';

import '../../app/mentor_app_router.dart';

/// Substitui a rota atual sem animação (duração zero).
Future<void> pushReplacementNamedInstant(
  BuildContext context,
  String name, {
  Object? arguments,
}) {
  final settings = RouteSettings(name: name, arguments: arguments);
  final route =
      MentorAppRouter.onGenerateRoute(settings) as MaterialPageRoute<void>;
  final page = route.builder(context);
  return Navigator.of(context).pushReplacement<void, void>(
    PageRouteBuilder<void>(
      settings: settings,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          child,
    ),
  );
}

/// Substitui a rota atual por uma rota nomeada com transição em fade.
Future<void> pushReplacementNamedFade(
  BuildContext context,
  String name, {
  Object? arguments,
}) {
  final settings = RouteSettings(name: name, arguments: arguments);
  final route =
      MentorAppRouter.onGenerateRoute(settings) as MaterialPageRoute<void>;
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
