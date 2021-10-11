import 'package:dispatcher/ui/pages/home_page.dart';
import 'package:dispatcher/ui/pages/unknown_page.dart';
import 'package:dispatcher/utils/app_router.dart';
import 'package:dispatcher/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
