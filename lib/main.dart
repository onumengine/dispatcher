import 'package:dispatcher/injection_container.dart' as injector;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/navigation/app_router.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'dispatcher',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: GoogleFonts.ubuntuTextTheme(),
        primaryColor: ColorPalette.PRIMARY,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ColorPalette.PRIMARY,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 24 / 16,
            color: ColorPalette.TEXTFIELD_HINT_COLOR,
          ),
          iconColor: ColorPalette.TEXTFIELD_HINT_COLOR,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.PRIMARY),
          ),
        ),
      ),
      initialRoute: RouteNames.SPLASH,
      onGenerateRoute: (settings) =>
          injector.serviceLocator<AppRouter>().generateRoute(settings),
    );
  }
}
