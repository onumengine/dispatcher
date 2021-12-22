import 'package:flutter/material.dart';

enum SignUpState {
  defaultState,
  loggingIn,
  loggedIn,
}

class SignUpViewModel extends ChangeNotifier {
  SignUpState _loginState = SignUpState.defaultState;
  SignUpState get loginState => _loginState;

  bool _passwordIsVisible = false;
  bool get passwordIsVisible => _passwordIsVisible;

  bool fullNameIsValid(String fullName) {
    return fullName.runtimeType == String && fullName.contains(" ");
  }

  bool passwordIsStrong(String password) {
    return password.length >= 6;
  }

  void togglePasswordVisibility() {
    _passwordIsVisible = !_passwordIsVisible;
    notifyListeners();
  }
}
