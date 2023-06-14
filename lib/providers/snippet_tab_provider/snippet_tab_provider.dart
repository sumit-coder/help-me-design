import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

class SnippetTabProvider with ChangeNotifier {
  List<Document> snippetsCollectionData = [];
  List<Document> activeSnippetsCollectionsSnippetsData = [];
  bool openActiveSnippetCollectionView = false;
  int indexOfClickedSnippetCollection = 0;

  changeCollectionView(bool newValue, int setActiveCollectionIndex) {
    indexOfClickedSnippetCollection = setActiveCollectionIndex;
    openActiveSnippetCollectionView = newValue;
    notifyListeners();
  }

  getSnippetsData(String userId) async {
    snippetsCollectionData = await DatabasesService.get.snippetsCollection(userId: userId);
    notifyListeners();
  }

  getActiveSnippetsCollectionData() async {
    activeSnippetsCollectionsSnippetsData = await DatabasesService.get.snippets(
      currentSnippetsCollectionId: snippetsCollectionData[indexOfClickedSnippetCollection].$id,
    );
    notifyListeners();
  }

  makeActiveSnippetsCollectionDataToEmpty() {
    activeSnippetsCollectionsSnippetsData = [];
    notifyListeners();
  }
}
