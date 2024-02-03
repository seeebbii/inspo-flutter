import 'package:inspo/utils/logger.dart';
import 'package:flutter/material.dart';

// create a custom navigator observer
class CustomNavigatorObserver extends NavigatorObserver {
  static String? lastRouteName = '';

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    lastRouteName = route.settings.name;
    Log.d('didPush: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    lastRouteName = previousRoute?.settings.name;
    Log.d('didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    lastRouteName = previousRoute?.settings.name;
    Log.d('didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    lastRouteName = newRoute?.settings.name;
    Log.d('didReplace: ${newRoute?.settings.name}');
  }
}
