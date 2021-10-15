import 'package:dispatcher/core/presentation/pages/unknown_page.dart';
import 'package:dispatcher/features/location/presentation/pages/home_page.dart';
import 'package:dispatcher/utils/app_router.dart';
import 'package:dispatcher/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
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
        scaffoldBackgroundColor: brandBackground,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) => AppRouter().generateRoute(settings),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UnknownPage(),
      ),
    );
  }
}
