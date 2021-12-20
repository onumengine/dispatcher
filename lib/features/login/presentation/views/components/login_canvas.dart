import 'package:flutter/material.dart';

class LoginCanvas extends StatelessWidget {
  const LoginCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Theme.of(context).primaryColor,
    );
  }
}
