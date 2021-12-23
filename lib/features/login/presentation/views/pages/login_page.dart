import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/core/theming/color_palettes.dart';
import 'package:dispatcher/features/login/presentation/view_models/login_view_model.dart';
import 'package:dispatcher/features/login/presentation/views/components/login_canvas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _fullName = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) =>
            LayoutBuilder(builder: (context, constraints) {
          return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              LoginCanvas(),
              Container(
                height: screenSize.height / 2.25,
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
                      SizedBox(height: screenSize.height / 47.2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Checkbox(
                                value: viewModel.rememberMe,
                                onChanged: (value) {
                                  viewModel.setRememberMe(value!);
                                },
                                fillColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 18 / 12,
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .iconColor,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 11,
                                height: 16.5 / 11,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        ],
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
                          viewModel.login(
                              _fullName.text, _password.text, _formKey);
                          Navigator.of(context)
                              .pushNamed(RouteNames.PHONE_VERIFICATION);
                        },
                        child: (viewModel.loginState == LoginState.loggingIn)
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text('Login'),
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
                          Navigator.of(context).pushNamed(RouteNames.SIGN_UP);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              height: 24 / 16,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: ColorPalette.PALE_TEXT_COLOR,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
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
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _fullName.dispose();
    _password.dispose();
    super.dispose();
  }
}
