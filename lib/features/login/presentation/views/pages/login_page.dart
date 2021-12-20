import 'package:dispatcher/features/login/presentation/views/components/login_canvas.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          LoginCanvas(),
          Container(
            height: 325,
            width: 354,
            padding: EdgeInsets.symmetric(horizontal: 26),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset.zero,
                  blurRadius: 4,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
