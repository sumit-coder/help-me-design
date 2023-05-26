import 'package:flutter/material.dart';

class SnippetTabProvider with ChangeNotifier {
  bool openActiveSnippetCollectionView = true;

  changeCollectionView(bool newValue) {
    openActiveSnippetCollectionView = newValue;
    notifyListeners();
  }
}
