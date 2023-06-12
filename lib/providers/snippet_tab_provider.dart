import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

class SnippetTabProvider with ChangeNotifier {
  List<Document> snippetsCollectionData = [];
  bool openActiveSnippetCollectionView = false;
  int indexOfClickedSnippetCollection = 0;

  changeCollectionView(bool newValue, int setActiveCollectionIndex) {
    openActiveSnippetCollectionView = newValue;
    indexOfClickedSnippetCollection = setActiveCollectionIndex;
    notifyListeners();
  }

  getSnippetsData(String userId) async {
    snippetsCollectionData = await DatabasesService.get.snippetsCollection(userId: userId);
    notifyListeners();
  }
}
