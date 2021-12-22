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

  bool fullNameIsValid(String fullName) {
    return fullName.runtimeType == String && fullName.contains(" ");
  }

  bool passwordIsStrong(String password) {
    return password.length >= 6;
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _passwordIsVisible = !_passwordIsVisible;
    notifyListeners();
  }
}
