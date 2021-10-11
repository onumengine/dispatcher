import 'package:dispatcher/ui/pages/home_page.dart';
import 'package:dispatcher/ui/pages/map_page.dart';
import 'package:dispatcher/ui/pages/service_selection_page.dart';
import 'package:dispatcher/utils/constants.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (context) => HomePage());
      case ROUTE_MAP:
        return MaterialPageRoute(builder: (context) => MapPage());
      case ROUTE_SERVICE_SELECTION:
        return MaterialPageRoute(builder: (context) => ServiceSelectionPage());
      default:
    }
  }
}
