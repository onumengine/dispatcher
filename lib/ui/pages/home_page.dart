import 'package:dispatcher/ui/organisms/home_fragment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dispatcher'),
      ),
      body: HomeFragment(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
