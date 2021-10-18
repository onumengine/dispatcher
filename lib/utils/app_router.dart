import 'package:dispatcher/core/presentation/pages/home_page.dart';
import 'package:dispatcher/features/location/presentation/bloc/bloc.dart';
import 'package:dispatcher/features/location/presentation/bloc/state.dart';
import 'package:dispatcher/features/location/presentation/pages/map_page.dart';
import 'package:dispatcher/core/presentation/pages/service_selection_page.dart';
import 'package:dispatcher/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
          builder: (context) => BlocProvider(
            create: (context) => MapBloc(
              MapLoadedState(
                pointerLocation: const LatLng(45.521563, -122.677433),
              ),
            ),
            child: MapPage(),
          ),
        );
      case ROUTE_SERVICE_SELECTION:
        return MaterialPageRoute(builder: (context) => ServiceSelectionPage());
      default:
        break;
    }
  }
}
