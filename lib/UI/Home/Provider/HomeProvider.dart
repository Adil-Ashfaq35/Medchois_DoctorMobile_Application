import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int currentScreenIndex = 0;

  setScreenIndex(int value) {
    currentScreenIndex = value;
    notifyListeners();
  }
}
