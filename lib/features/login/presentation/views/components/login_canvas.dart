import 'package:dispatcher/core/theming/color_palettes.dart';
import 'package:flutter/material.dart';

class LoginCanvas extends StatelessWidget {
  const LoginCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints.expand(),
      color: ColorPalette.BACKGROUND_LIGHT,
      child: CustomPaint(
        painter: LoginPainter(screenSize: screenSize),
      ),
    );
  }
}

class LoginPainter extends CustomPainter {
  Size screenSize;
  LoginPainter({required this.screenSize});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBrush = Paint()
      ..color = Color(0xff807272).withOpacity(0.3)
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        screenSize.width / 6,
        0,
        screenSize.width,
        screenSize.height / 5,
        bottomLeft: Radius.circular(10),
      ),
      paintBrush,
    );
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        0,
        screenSize.height / 8.22,
        screenSize.width / 1.92,
        screenSize.height / 2.71,
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      paintBrush,
    );
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        screenSize.width / 1.79,
        screenSize.height / 1.79,
        screenSize.width,
        screenSize.height / 1.45,
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      paintBrush,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
