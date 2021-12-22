import 'dart:async';

import 'package:flutter/material.dart';

enum SignUpState {
  defaultState,
  signingIn,
  signedIn,
}

class SignUpViewModel extends ChangeNotifier {
  SignUpState _signUpState = SignUpState.defaultState;
  SignUpState get signUpState => _signUpState;

  bool _passwordIsVisible = false;
  bool get passwordIsVisible => _passwordIsVisible;

  void setSignUpState(SignUpState state) {
    _signUpState = state;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _passwordIsVisible = !_passwordIsVisible;
    notifyListeners();
  }

  String? fullNameIsValid(String? fullName) {
    return fullName!.length > 0
        ? fullName.contains(' ')
            ? null
            : "You entered an invalid name"
        : "You didn\'t enter a name";
  }

  String? emailIsValid(String? email) {
    return email!.length > 0
        ? email.contains('@')
            ? null
            : "You entered an invalid email"
        : "You didn\'t enter an email";
  }

  String? passwordIsStrong(String? password) {
    return password!.length >= 6
        ? null
        : 'Please enter a password that has at least 6 digits';
  }

  bool formIsValid(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }

  void signUp(String fullName, String email, String password,
      GlobalKey<FormState> formKey) {
    if (formIsValid(formKey)) {
      setSignUpState(SignUpState.signingIn);
      Timer(Duration(milliseconds: 2000), () {
        setSignUpState(SignUpState.signedIn);
      });
    }
  }
}
