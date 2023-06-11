import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants.dart';
import 'package:help_me_design/models/design_resources_model.dart';
import 'package:help_me_design/views/screens/tabs/components_tab/widgets/add_component_collection_alert.dart';

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

class Add {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  addComponentCollection({required String title, required String tags, required String userId}) {
    final databases = Databases(client);
    try {
      final document = databases.createDocument(
        databaseId: '6481a970aa1248a2b697',
        collectionId: '6481a9bc39b87d8f945f',
        documentId: ID.unique(),
        data: {
          "resourceTitle": "Favicons",
          "resourcesCount": "data.length",
          "resourceDescription": "Resources for Favicons",
          "resourcesList": "data"
        },
      );
      // databases.updateDocument(
      //     databaseId: '6481a970aa1248a2b697',
      //     collectionId: '6481a9bc39b87d8f945f',
      //     documentId: '6481b8a3665801de54ec',
      //     data: {
      //       "resourcesList": ["card"],
      //     });
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}
