import 'package:dispatcher/core/navigation/app_router.dart';
import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/injection_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        scaffoldBackgroundColor: ColorPalette.BACKGROUND_PEACH,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: GoogleFonts.ubuntuTextTheme(),
        primaryColor: ColorPalette.PRIMARY,
      ),
      initialRoute: RouteNames.SPLASH,
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
    );
  }
}
