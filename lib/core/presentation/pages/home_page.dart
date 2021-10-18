import 'package:dispatcher/core/presentation/components/home_fragment.dart';
import 'package:dispatcher/utils/colors.dart';
import 'package:dispatcher/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandBackgroundApp,
      body: HomeFragment(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.shopping_cart_outlined),
        onPressed: () {
          Navigator.of(context).pushNamed(ROUTE_MAP);
        },
      ),
    );
  }
}
