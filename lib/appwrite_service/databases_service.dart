import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
// import 'package:help_me_design/appwrite_service/appwrite_constants.dart';
import 'package:help_me_design/models/design_resources_model.dart';
import 'package:help_me_design/providers/snippet_tab_provider.dart';
import 'package:help_me_design/utility/utility_helper.dart';
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

  Future<bool> componentsCollection({required String title, required String tags, required String userId}) async {
    // componentsCollection() {
    final databases = Databases(client);
    try {
      final document = await databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsCollectionId,
        documentId: ID.unique(),
        data: {
          "userId": userId,
          "title": title,
          "tags": tags,
          "collectionsCount": 0,
        },
      );

      UtilityHelper.toastMessage(message: "Components Collection Added");
      return true;
    } on AppwriteException catch (e) {
      UtilityHelper.toastMessage(message: e.message ?? "add.componentsCollection() null message");
      print(e);
      return false;
    }
  }

  Future<bool> component({required String title, required String collectionId}) async {
    final databases = Databases(client);
    try {
      final document = await databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsId,
        documentId: ID.unique(),
        data: {
          "collectionId": collectionId,
          "title": title,
          "previewType": "",
          "previewUrl": "",
          "code": "",
          "codeLanguage": "",
        },
      );
      UtilityHelper.toastMessage(message: "Component Added");
      return true;
    } on AppwriteException catch (e) {
      UtilityHelper.toastMessage(message: e.message ?? "add.component() null message");
      print(e);
      return false;
    }
  }

  Future<bool> snippetsCollection({required String title, required String tags, required String userId}) async {
    // componentsCollection() {
    final databases = Databases(client);
    try {
      final document = await databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedSnippetCollectionId,
        documentId: ID.unique(),
        data: {
          "userId": userId,
          "title": title,
          "tags": tags,
          "snippetsCount": 0,
        },
      );
      UtilityHelper.toastMessage(message: "Snippets Collection Added");
      return true;
    } on AppwriteException catch (e) {
      UtilityHelper.toastMessage(message: e.message ?? "add.snippetsCollection() null message");
      print(e);
      return false;
    }
  }

  Future<bool> snippets({required String title, required String description, required String collectionId}) async {
    final databases = Databases(client);
    try {
      final document = await databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedSnippetId,
        documentId: ID.unique(),
        data: {
          "collectionId": collectionId,
          "title": title,
          "description": description,
          "code": "",
          "codeLanguage": "",
        },
      );
      UtilityHelper.toastMessage(message: "Snippet Added");

      return true;
    } on AppwriteException catch (e) {
      UtilityHelper.toastMessage(message: e.message ?? "add.component() null message");
      log(e.toString());
      return false;
    }
  }
}

class Get {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  Future<List<Document>> componentsCollection({required String userId}) async {
    final databases = Databases(client);
    try {
      final data = await databases.listDocuments(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsCollectionId,
        queries: [
          Query.equal('userId', userId),
          Query.orderDesc('\$createdAt'),
        ],
      );
      log("Get.componentsCollection");
      return data.documents;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "get.componentsCollection() null message");
      return [];
    }
  }

  Future<List<Document>> components({required String currentComponentsCollectionId}) async {
    final databases = Databases(client);
    try {
      final data = await databases.listDocuments(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsId,
        queries: [
          Query.equal('collectionId', currentComponentsCollectionId),
        ],
      );
      log("Get.components");
      return data.documents;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "get.components() null message");
      return [];
    }
  }

  Future<List<Document>> snippetsCollection({required String userId}) async {
    final databases = Databases(client);
    try {
      final data = await databases.listDocuments(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedSnippetCollectionId,
        queries: [
          Query.equal('userId', [userId]),
          Query.orderDesc('\$createdAt'),
        ],
      );
      log("Get.snippetsCollection");
      return data.documents;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "get.componentsCollection() null message");
      return [];
    }
  }

  Future<List<Document>> snippets({required String currentSnippetsCollectionId}) async {
    final databases = Databases(client);
    try {
      final data = await databases.listDocuments(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedSnippetId,
        queries: [
          Query.equal('collectionId', currentSnippetsCollectionId),
          Query.orderDesc('\$createdAt'),
        ],
      );
      log("Get.snippets");
      return data.documents;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "get.components() null message");
      return [];
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
