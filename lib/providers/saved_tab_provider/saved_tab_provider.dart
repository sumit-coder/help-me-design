import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

class SavedTabProvider with ChangeNotifier {
  List<Document> listOfSavedDesignResources = [];

  getSavedDesignResources(String userId) async {
    listOfSavedDesignResources = await DatabasesService.get.savedDesignResource(userId: userId);

    notifyListeners();
  }
}
