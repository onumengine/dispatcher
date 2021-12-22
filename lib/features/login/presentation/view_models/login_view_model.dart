import 'dart:async';

import 'package:flutter/material.dart';

enum LoginState {
  defaultState,
  loggingIn,
  loggedIn,
}

class LoginViewModel extends ChangeNotifier {
  LoginState _loginState = LoginState.defaultState;
  LoginState get loginState => _loginState;

  bool _rememberMe = true;
  bool get rememberMe => _rememberMe;

  bool _passwordIsVisible = false;
  bool get passwordIsVisible => _passwordIsVisible;

  void setLoginState(LoginState state) {
    _loginState = state;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
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

  String? passwordIsStrong(String? password) {
    return password!.length >= 6
        ? null
        : 'Please enter a password that has at least 6 digits';
  }

  bool formIsValid(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }

  void login(String fullName, String password, GlobalKey<FormState> formKey) {
    if (formIsValid(formKey)) {
      setLoginState(LoginState.loggingIn);
      Timer(Duration(milliseconds: 2000), () {
        setLoginState(LoginState.loggedIn);
      });
    }
  }
}
