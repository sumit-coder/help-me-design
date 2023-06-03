import 'package:flutter/material.dart';

class ComponentTabProvider with ChangeNotifier {
  bool openActiveComponentCollectionView = false;
  int activeComponentCollectionIndex = 0;
  int activeComponentViewIndex = 0;

  changeActiveComponentViewIndex(int newValue) {
    activeComponentViewIndex = newValue;

    notifyListeners();
  }

  changeActiveComponentCollectionView(bool newValue) {
    openActiveComponentCollectionView = newValue;

    notifyListeners();
  }
}
