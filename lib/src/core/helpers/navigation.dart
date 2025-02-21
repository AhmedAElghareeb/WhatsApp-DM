import 'package:flutter/material.dart';

abstract class NavigationRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void onPushReplacementNamed(
          {required String route, dynamic arguments}) async =>
      await Navigator.of(navigatorKey.currentContext!).pushReplacementNamed(
        route,
        arguments: arguments,
      );

  static void onPop() => Navigator.pop(navigatorKey.currentContext!);
}
