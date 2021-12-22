import 'package:dispatcher/features/login/presentation/view_models/login_view_model.dart';
import 'package:dispatcher/features/login/presentation/views/components/login_canvas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) => Stack(
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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
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
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          hintText: 'Full Name',
                        ),
                      ),
                      SizedBox(height: screenSize.height / 23.56),
                      TextFormField(
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
                      SizedBox(height: screenSize.height / 11.49),
                    ],
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
