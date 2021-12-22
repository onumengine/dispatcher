import 'package:dispatcher/core/theming/color_palettes.dart';
import 'package:dispatcher/features/login/presentation/views/components/login_canvas.dart';
import 'package:dispatcher/features/sign_up/presentation/view_models/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<SignUpViewModel>(
        builder: (context, viewModel, child) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            LoginCanvas(),
            Container(
              height: screenSize.height / 1.68,
              width: screenSize.width / 1.17,
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 47.2),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins().copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 36 / 24,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height / 15.19),
                    TextFormField(
                      controller: _fullName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Full Name',
                      ),
                      validator: viewModel.fullNameIsValid,
                    ),
                    SizedBox(height: screenSize.height / 23.56),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'Email',
                      ),
                      validator: viewModel.emailIsValid,
                    ),
                    SizedBox(height: screenSize.height / 23.56),
                    TextFormField(
                      controller: _password,
                      autocorrect: false,
                      obscureText: !viewModel.passwordIsVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                          onTap: viewModel.togglePasswordVisibility,
                          child: Icon(
                            viewModel.passwordIsVisible
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        hintText: 'Password',
                      ),
                      validator: viewModel.passwordIsStrong,
                    ),
                    SizedBox(height: screenSize.height / 23.56),
                    TextFormField(
                      controller: _confirmPassword,
                      autocorrect: false,
                      obscureText: !viewModel.passwordIsVisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                          onTap: viewModel.togglePasswordVisibility,
                          child: Icon(
                            viewModel.passwordIsVisible
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        hintText: 'Confirm Password',
                      ),
                      validator: viewModel.passwordIsStrong,
                    ),
                    Flexible(
                      child: SizedBox(),
                      fit: FlexFit.tight,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: screenSize.height / 37.3,
              child: Container(
                width: screenSize.width / 1.17,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        viewModel.signUp(
                          _fullName.text,
                          _email.text,
                          _password.text,
                          _formKey,
                        );
                      },
                      child: viewModel.signUpState == SignUpState.signingIn
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text('Sign Out'),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(MediaQuery.of(context).size.width, 50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height / 40.72,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontSize: 16,
                            height: 24 / 16,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: ColorPalette.PALE_TEXT_COLOR,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
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
                    SizedBox(
                      height: screenSize.height / 37.3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
