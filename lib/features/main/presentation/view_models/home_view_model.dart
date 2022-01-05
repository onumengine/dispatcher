import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  void switchToTab(int index) {
    tabIndex = index;
  }
}
