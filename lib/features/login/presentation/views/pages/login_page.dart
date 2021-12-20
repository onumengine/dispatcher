import 'package:dispatcher/features/login/presentation/views/components/login_canvas.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Positioned.fill(child: LoginCanvas())],
      ),
    );
  }
}
