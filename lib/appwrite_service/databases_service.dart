import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
// import 'package:help_me_design/appwrite_service/appwrite_constants.dart';
import 'package:help_me_design/models/design_resources_model.dart';
import 'package:help_me_design/views/screens/tabs/components_tab/widgets/add_component_collection_alert.dart';

import 'appwrite_constants_all.dart';

class DatabasesService {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  static Add add = Add();
  static Get get = Get();

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

  // componentsCollection({required String title, required String tags, required String userId}) {
  componentsCollection() {
    final databases = Databases(client);
    try {
      final document = databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsCollectionID,
        documentId: ID.unique(),
        data: {
          "user_id": "data",
          "title": "First",
          "tags": "Flutter,Dart",
          "components_count": 0,
          "list_of_components": [
            '{"title":"akz", "previewType":"img","previewUrl": "google.com", "code": "${code.replaceAll('"', '\\"').replaceAll(RegExp(r"\s+"), "")}" }'
          ]
        },
      );
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  componentInCollection({required String title, required String tags, required String userId}) {
    final databases = Databases(client);
    try {
      final document = databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsCollectionID,
        documentId: ID.unique(),
        data: {
          "user_id": "data",
          "title": "First",
          "tags": "Flutter,Dart",
          "components_count": 0,
          "list_of_components": ['{"title":"akz", "previewType":"img","previewUrl": "google.com", "code": "${code}" }'],
        },
      );
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}

class Get {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  Future<String> componentsCollection() async {
    final databases = Databases(client);
    try {
      final document = await databases.getDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsCollectionID,
        documentId: "6484dfbc9b076f3afc22",
        // data: {
        //   "user_id": "data",
        //   "title": "First",
        //   "tags": "Flutter,Dart",
        //   "components_count": 0,
        //   "list_of_components": [
        //     '{"title":"akz", "previewType":"img","previewUrl": "google.com", "code": "${code.replaceAll('"', '\\"')}" }'
        //   ]
        // },
      );

      print(document.data);
      var data = jsonDecode(document.data["list_of_components"][0]);
      return data["code"];
    } on AppwriteException catch (e) {
      print(e);
      return '';
    }
  }
}

String code = ''' Positioned(
           top: 8,
           left: 8,
           child: Text(
           "Preview",
           maxLines: 2,
           style: themeData.textTheme.titleSmall,
           ),
           ),''';
