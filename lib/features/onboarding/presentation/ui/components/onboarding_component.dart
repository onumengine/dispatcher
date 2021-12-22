import 'package:dispatcher/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingComponent extends StatelessWidget {
  final String title, subtitle, buttonText, imageName;
  final VoidCallback onTap;

  const OnboardingComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: constraints.maxHeight / 5.24,
            ),
            Image.asset(
              IMAGES_PATH + imageName,
              height: constraints.maxHeight / 3.06,
            ),
            Flexible(
              child: SizedBox(),
              fit: FlexFit.tight,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 36,
                fontWeight: FontWeight.w500,
                height: 54 / 36,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight / 89.6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 25.2 / 18,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight / 11.78,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: onTap,
                child: Text(
                  buttonText,
                ),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(constraints.maxWidth, 50),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight / 14,
            ),
          ],
        ),
      );
    });
  }
}
