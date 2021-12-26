import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/core/theming/color_palettes.dart';
import 'package:dispatcher/features/phone_verification/presentation/view_models/phone_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpInputComponent extends StatelessWidget {
  const OtpInputComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 12,
            vertical: constraints.maxHeight / 13,
          ),
          child: Column(
            children: <Widget>[
              Text(
                'OTP Verfication',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  height: 36 / 24,
                  color: Theme.of(context).primaryColor,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth / 35,
                ),
                child: Text(
                  'Please enter the verification code sent to (+234)8127461653',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 21 / 18,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight / 11.74,
              ),
              Container(
                height: 45,
                child: OtpTextField(
                  fieldWidth: constraints.maxWidth / 7,
                  showFieldAsBox: true,
                  borderColor: Colors.white,
                  focusedBorderColor: ColorPalette.PRIMARY,
                  borderWidth: 2,
                  borderRadius: BorderRadius.circular(10),
                  fillColor: ColorPalette.OTP_BACKGROUND_COLOR,
                  filled: true,
                  numberOfFields: 5,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.DARK_TEXT_COLOR,
                    height: 23 / 20,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight / 12.46,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<PhoneVerificationViewModel>().goToPage(1);
                },
                child: Text(
                  'Verify',
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
              SizedBox(
                height: constraints.maxHeight / 81,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteNames.PHONE_VERIFIED);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Didn\'t receive the code? ',
                    style: TextStyle(
                      fontSize: 16,
                      height: 24 / 16,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: ColorPalette.PALE_TEXT_COLOR,
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend code',
                        style: TextStyle(
                          fontSize: 16,
                          height: 24 / 16,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: ColorPalette.PRIMARY,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
