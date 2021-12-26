import 'package:dispatcher/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneVerifiedPage extends StatelessWidget {
  const PhoneVerifiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width / 13.8) +
            EdgeInsets.only(
              bottom: screenSize.height / 13,
              top: screenSize.height / 7.66,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: [
                Text(
                  'Verified',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 36 / 24,
                    color: Theme.of(context).primaryColor,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Your phone has been verified!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 21 / 18,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SvgPicture.asset(VECTOR_IMAGES_PATH + 'verified.svg'),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 27 / 18,
                ),
              ),
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
