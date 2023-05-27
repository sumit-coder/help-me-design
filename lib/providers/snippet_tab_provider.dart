import 'package:flutter/material.dart';

class SnippetTabProvider with ChangeNotifier {
  bool openActiveSnippetCollectionView = false;

  changeCollectionView(bool newValue) {
    openActiveSnippetCollectionView = newValue;
    notifyListeners();
  }
}
