import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:readingapps/configuration/app_logger.dart';

class AppRouterObserver extends AutoRouteObserver {
  final _log = AppLogger.getLogger("AppRouterObserver");

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _log.debug("New route pushed: ${route.settings.name}");
  }
}
