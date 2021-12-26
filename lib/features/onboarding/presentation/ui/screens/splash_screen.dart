import 'dart:async';

import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2000),
      () {
        Navigator.of(context).pushReplacementNamed(RouteNames.ONBOARDING);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              IMAGES_PATH + 'dish.png',
              width: 267,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Dispatch',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w600,
                      height: 66 / 44,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Now',
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
                  'Speedy deliveries for you',
                  style: TextStyle(
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    height: 38.9 / 18,
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
