import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

class ComponentTabProvider with ChangeNotifier {
  List<Document> componentsCollectionData = [];
  List<Document> activeCollectionComponentsData = [];
  // Nav
  bool openActiveComponentCollectionView = false;
  int activeComponentCollectionIndex = 0;
  int activeComponentViewIndex = 0;
  //

  changeActiveComponentViewIndex(int newValue) {
    activeComponentViewIndex = newValue;

    notifyListeners();
  }

  changeOpenActiveComponentCollectionView(bool newValue, int clickedCollectionIndex) {
    activeComponentCollectionIndex = clickedCollectionIndex;
    openActiveComponentCollectionView = newValue;

    notifyListeners();
  }

  getComponentsCollectionData(String userId) async {
    componentsCollectionData = await DatabasesService.get.componentsCollection(
      userId: userId,
    );
    notifyListeners();
  }

  getActiveCollectionComponentsData() async {
    activeCollectionComponentsData = await DatabasesService.get.components(
      currentComponentsCollectionId: componentsCollectionData[activeComponentCollectionIndex].$id,
    );
    notifyListeners();
  }
}
