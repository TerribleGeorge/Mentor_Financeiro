import 'package:flutter/material.dart';

/// Chave global do [Navigator] raiz — permite navegar mesmo quando o [context]
/// da rota actual não encontra o navigator (ex.: durante transições).
final GlobalKey<NavigatorState> mentorNavigatorKey =
    GlobalKey<NavigatorState>();
