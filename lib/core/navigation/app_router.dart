import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/features/location/domain/use_cases/FetchLocation.dart';
import 'package:dispatcher/features/location/presentation/view_models/map_view_model.dart';
import 'package:dispatcher/features/location/presentation/views/pages/map_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/home_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/service_selection_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/unknown_page.dart';
import 'package:dispatcher/features/onboarding/presentation/ui/screens/splash_screen.dart';
import 'package:dispatcher/injection_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.HOME:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      /*
      case RouteNames.MAP:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => MapViewModel(
              fetchLocation: injector.serviceLocator<FetchLocation>(),
            ),
            child: MapPage(),
          ),
        );
        */
      case RouteNames.SERVICE_SELECTION:
        return MaterialPageRoute(
          builder: (context) => ServiceSelectionPage(),
        );
      case RouteNames.SPLASH:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => UnknownPage(),
        );
    }
  }
}
