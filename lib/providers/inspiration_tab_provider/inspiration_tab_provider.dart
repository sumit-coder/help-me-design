import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

class InspirationTabProvider with ChangeNotifier {
  List<Document> listOfCurrentUserInspirations = [];

  getCurrentUsersInspirationsData(String userId) async {
    listOfCurrentUserInspirations = await DatabasesService.get.inspirationFiles(userId: userId);

    notifyListeners();
  }
}
