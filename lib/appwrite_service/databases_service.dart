import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants.dart';
import 'package:help_me_design/models/design_resources_model.dart';

class DatabasesService {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  Future<DesignResourcesCollection> getDesignResourcesData() async {
    Databases databases = Databases(client);
    // Your project ID
    DocumentList databasesResponse = await databases.listDocuments(
      databaseId: '6481a970aa1248a2b697',
      collectionId: '6481a9bc39b87d8f945f',
    );

    return DesignResourcesCollection.fromJson(databasesResponse.documents);
  }
}
