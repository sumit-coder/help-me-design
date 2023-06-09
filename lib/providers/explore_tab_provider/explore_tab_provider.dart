import 'package:flutter/widgets.dart';
import 'package:help_me_design/appwrite_service/databases_service.dart';

import '../../models/design_resources_model.dart';

class ExploreTabProvider with ChangeNotifier {
  DesignResourcesCollection? designResourcesCollection;

  initDesignResourcesData() async {
    designResourcesCollection = await DatabasesService().getDesignResourcesData();

    print(designResourcesCollection!.data);

    notifyListeners();
  }
}
