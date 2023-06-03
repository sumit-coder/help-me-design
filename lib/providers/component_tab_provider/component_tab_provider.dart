import 'package:flutter/material.dart';

class ComponentTabProvider with ChangeNotifier {
  int activeComponentViewIndex = 0;

  changeActiveComponentViewIndex(int newValue) {
    activeComponentViewIndex = newValue;

    notifyListeners();
  }
}
