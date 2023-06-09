import 'package:flutter/widgets.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

import '../../models/design_resources_model.dart';

class ExploreTabProvider with ChangeNotifier {
  bool showListItemView = false;
  int showListItemViewIndex = 0;
  DesignResourcesCollection? designResourcesCollection = DesignResourcesCollection.empty();

  initDesignResourcesData() async {
    designResourcesCollection = await DatabasesService().getDesignResourcesData();

    print(designResourcesCollection!.data);

    notifyListeners();
  }

  setActiveItemView({required int index, required bool viewValue}) {
    showListItemView = viewValue;
    showListItemViewIndex = index;

    notifyListeners();
  }
}
