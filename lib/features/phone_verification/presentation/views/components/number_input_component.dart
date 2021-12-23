import 'package:dispatcher/features/phone_verification/presentation/view_models/phone_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NumberInputComponent extends StatelessWidget {
  const NumberInputComponent({Key? key}) : super(key: key);

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
                'Welcome',
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
                  'Please enter your phone number to start using this app',
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
              // TODO: Add phone number text field here
              SizedBox(
                height: constraints.maxHeight / 12.46,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<PhoneVerificationViewModel>().goToPage(1);
                },
                child: Text(
                  'Next',
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
        );
      },
    );
  }
}
