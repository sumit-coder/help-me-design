import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants.dart';
import 'package:help_me_design/models/design_resources_model.dart';

class DatabasesService {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  getDesignResourcesData() {
    Databases databases = Databases(client);
    // Your project ID

    databases
        .listDocuments(
      databaseId: '6481a970aa1248a2b697',
      collectionId: '6481a9bc39b87d8f945f',
    )
        .then((result) {
      print(DesignResourcesCollection.fromJson(result.documents).data.length);
    }).catchError((onError) {
      print(onError);
    });

    // result.then((response) {
    //   print(response.documents.first.data['resourcesList'].length);

    //   // return DesignResourcesCollection.fromJson(response.documents);
    // }).catchError((error) {
    //   print(error);
    // });

    // return DesignResourcesCollection();
  }
}
