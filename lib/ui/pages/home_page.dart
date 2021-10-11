import 'package:dispatcher/ui/organisms/home_fragment.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
