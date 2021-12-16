import 'package:dispatcher/injection_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/navigation/app_route_info_parser.dart';
import 'core/navigation/app_router_delegate.dart';
import 'core/navigation/route_info_model.dart';
import 'core/navigation/route_names.dart';
import 'core/theming/color_palettes.dart';

void main() {
  injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dispatcher',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.orangeAccent,
        scaffoldBackgroundColor: ColorPalette.BACKGROUND_PEACH,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      home: Router(
        routerDelegate: AppRouterDelegate(),
        backButtonDispatcher: RootBackButtonDispatcher(),
        routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: RouteInformation(location: RouteNames.HOME),
        ),
        routeInformationParser: AppRouteInfoParser<RouteInfoModel>(),
      ),
    );
  }
}
