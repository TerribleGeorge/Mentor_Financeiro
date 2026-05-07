import 'package:flutter/material.dart';

import '../constants/app_routes.dart';

/// Mantém [isSplashRouteVisible] alinhado com a rota no topo do [Navigator].
///
/// O [MaterialApp.builder] usa isto para não desenhar [MentorAppBackdrop] por cima
/// da splash (senão a arte DevVoid “some” atrás de camadas globais).
final ValueNotifier<bool> splashRouteVisibleNotifier =
    ValueNotifier<bool>(true);

final NavigatorObserver splashRouteNavigatorObserver =
    _SplashRouteNavigatorObserver();

class _SplashRouteNavigatorObserver extends NavigatorObserver {
  bool _isSplashName(String? name) =>
      name == AppRoutes.splash || name == '/';

  void _sync(Route<dynamic>? route) {
    final visible = route != null && _isSplashName(route.settings.name);
    if (splashRouteVisibleNotifier.value != visible) {
      splashRouteVisibleNotifier.value = visible;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _sync(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _sync(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _sync(previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _sync(previousRoute);
  }
}
