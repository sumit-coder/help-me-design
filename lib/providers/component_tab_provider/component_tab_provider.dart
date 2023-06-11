import 'package:flutter/material.dart';

class ComponentTabProvider with ChangeNotifier {
  // Nav
  bool openActiveComponentCollectionView = false;
  int activeComponentCollectionIndex = 0;
  int activeComponentViewIndex = 0;
  //

  changeActiveComponentViewIndex(int newValue) {
    activeComponentViewIndex = newValue;

    notifyListeners();
  }

  changeActiveComponentCollectionIndex(int newValue) {
    activeComponentCollectionIndex = newValue;

    notifyListeners();
  }

  changeOpenActiveComponentCollectionView(bool newValue) {
    openActiveComponentCollectionView = newValue;

    notifyListeners();
  }
}
