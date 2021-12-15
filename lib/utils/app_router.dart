import 'package:dispatcher/features/location/presentation/view_models/MapViewModel.dart';
import 'package:dispatcher/features/location/presentation/views/pages/map_page.dart';
import 'package:dispatcher/features/main/presentation/home/home_page.dart';
import 'package:dispatcher/features/main/presentation/service_selection/service_selection_page.dart';
import 'package:dispatcher/injection_container.dart' as injector;
import 'package:dispatcher/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    return getRouteFromName(routeSettings.name!);
  }

  Route<dynamic>? getRouteFromName(String name) {
    switch (name) {
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (context) => HomePage());
      case ROUTE_MAP:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<MapViewModel>(
            create: (_) => injector.serviceLocator<MapViewModel>(),
            child: MapPage(),
            lazy: false,
          ),
        );
      case ROUTE_SERVICE_SELECTION:
        return MaterialPageRoute(builder: (context) => ServiceSelectionPage());
      default:
        break;
    }
  }
}
