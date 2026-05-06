import 'package:flutter/material.dart';

import '../../app/mentor_app_router.dart';

/// Empurra uma rota nomeada pelo [MentorAppRouter] (equivale a `push`, não `pushReplacement`).
void mentorPushNamed(
  BuildContext context,
  String name, {
  Object? arguments,
}) {
  final route = MentorAppRouter.onGenerateRoute(
    RouteSettings(name: name, arguments: arguments),
  );
  Navigator.of(context).push(route);
}
