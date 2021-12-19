import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/features/location/domain/use_cases/FetchLocation.dart';
import 'package:dispatcher/features/location/presentation/view_models/map_view_model.dart';
import 'package:dispatcher/features/location/presentation/views/pages/map_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/home_page.dart';
import 'package:dispatcher/features/main/presentation/views/pages/service_selection_page.dart';
import 'package:dispatcher/injection_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
      initialRoute: RouteNames.HOME,
      routes: {
        RouteNames.HOME: (context) => HomePage(),
        RouteNames.MAP: (context) => ChangeNotifierProvider(
              create: (context) => MapViewModel(
                fetchLocation: injector.serviceLocator<FetchLocation>(),
              ),
              child: MapPage(),
            ),
        RouteNames.SERVICE_SELECTION: (context) => ServiceSelectionPage(),
      },
    );
  }
}
