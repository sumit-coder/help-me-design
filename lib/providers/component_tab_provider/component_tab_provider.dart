import 'package:flutter/material.dart';

class ComponentTabProvider with ChangeNotifier {
  bool openActiveComponentCollectionView = true;
  int activeComponentCollectionIndex = 0;
  int activeComponentViewIndex = 0;

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
