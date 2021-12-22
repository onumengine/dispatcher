import 'package:flutter/material.dart';

class PhoneVerificationViewModel extends ChangeNotifier {
  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  void goToPage(int pageIndex) {
    _currentPageIndex = pageIndex;
    notifyListeners();
  }
}
