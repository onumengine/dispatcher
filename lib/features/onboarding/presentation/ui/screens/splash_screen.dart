import 'package:dispatcher/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(VECTOR_IMAGES_PATH + 'dish.svg'),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hungry',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      height: 66 / 44,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Man',
                        style: TextStyle(
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          fontSize: 44,
                          fontWeight: FontWeight.w600,
                          height: 66 / 44,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Healthy food for everyone',
                  style: TextStyle(
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    height: 6.96 / 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}