import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/features/main/presentation/views/components/home_fragment.dart';
import 'package:dispatcher/core/theming/color_palettes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.BACKGROUND_PEACH,
      body: HomeFragment(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.PRIMARY,
        foregroundColor: Colors.white,
        child: Icon(Icons.location_pin),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.MAP);
        },
      ),
    );
  }
}
