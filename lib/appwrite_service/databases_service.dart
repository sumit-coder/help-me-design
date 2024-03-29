import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/models/design_resources_model.dart';
import 'package:help_me_design/utility/utility_helper.dart';

import 'appwrite_constants_all.dart';

class DatabasesService {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  static Add add = Add();
  static Get get = Get();
  static Update update = Update();
  static DeleteData delete = DeleteData();
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
          "code": ''' 
class Example{
 final string thisIsExampleCode;
}
          ''',
          "codeLanguage": "dart",
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

  Future<bool> inspirationsFileInfo({
    required String fileUrl,
    required String userId,
    required String fileTitle,
    required String fileType,
    required String fileId,
  }) async {
    final databases = Databases(client);
    try {
      final document = await databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.inspirationsFilesCollectionID,
        documentId: ID.unique(),
        data: {
          "fileUrl": fileUrl,
          "userId": userId,
          "fileTitle": fileTitle,
          "fileType": fileType,
          "fileId": fileId,
        },
      );
      UtilityHelper.toastMessage(message: "inspirationsFile Added");

      return true;
    } on AppwriteException catch (e) {
      UtilityHelper.toastMessage(message: e.message ?? "add.inspirationsFileInfo() null message");
      log(e.toString());
      return false;
    }
  }

  Future<bool> saveDesignResource({
    required String userId,
    required String url,
    required String title,
    required String description,
    required String originalResourceId,
  }) async {
    final databases = Databases(client);
    try {
      final document = await databases.createDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedDesignResourcesId,
        documentId: ID.unique(),
        data: {
          "title": title,
          "url": url,
          "userId": userId,
          "description": description,
          "originalResourceId": originalResourceId,
        },
      );
      UtilityHelper.toastMessage(message: "Design Resource Saved");

      return true;
    } on AppwriteException catch (e) {
      UtilityHelper.toastMessage(message: e.message ?? "add.saveDesignResource() null message");
      log(e.toString());
      return false;
    }
  }
}

class Get {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  Future<DesignResourcesCollection> designResources() async {
    Databases databases = Databases(client);
    // Your project ID
    DocumentList databasesResponse = await databases
        .listDocuments(databaseId: AppWriteConst.publicDataDatabaseID, collectionId: AppWriteConst.designResourcesCollectionId, queries: [
      Query.limit(50),
    ]);

    return DesignResourcesCollection.fromJson(databasesResponse.documents);
  }

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
          Query.orderDesc('\$createdAt'),
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

  Future<List<Document>> inspirationFiles({required String userId}) async {
    final databases = Databases(client);
    try {
      final data = await databases.listDocuments(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.inspirationsFilesCollectionID,
        queries: [
          Query.equal('userId', userId),
          Query.orderDesc('\$createdAt'),
        ],
      );
      log("Get.inspirationFiles");
      return data.documents;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "get.inspirationFiles() null message");
      return [];
    }
  }

  Future<List<Document>> savedDesignResource({required String userId}) async {
    final databases = Databases(client);
    try {
      final data = await databases.listDocuments(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedDesignResourcesId,
        queries: [
          Query.equal('userId', userId),
          Query.orderDesc('\$createdAt'),
        ],
      );
      log("Get.savedDesignResource");
      return data.documents;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "get.savedDesignResource() null message");
      return [];
    }
  }
}

class Update {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  Future<bool> component({
    required String? code,
    required String? codeLanguage,
    required String? previewUrl,
    required String? previewType,
    required String? previewFileId,
    required String componentId,
  }) async {
    final databases = Databases(client);
    try {
      final data = await databases.updateDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedComponentsId,
        documentId: componentId,
        data: {
          if (code != null) "code": code,
          if (codeLanguage != null) "codeLanguage": codeLanguage,
          if (previewType != null) "previewType": previewType,
          if (previewUrl != null) "previewUrl": previewUrl,
          if (previewFileId != null) "previewFileId": previewFileId,
        },
      );
      log("Update.component");

      return true;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "update.components() null message");
      return false;
    }
  }

  Future<bool> snippet({
    required String? code,
    required String? codeLanguage,
    required String snippetId,
  }) async {
    final databases = Databases(client);
    try {
      final data = await databases.updateDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedSnippetId,
        documentId: snippetId,
        data: {
          if (code != null) "code": code,
          if (codeLanguage != null) "codeLanguage": codeLanguage,
        },
      );
      log("Update.snippet");
      return true;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "update.snippet() null message");
      return false;
    }
  }
}

class DeleteData {
  final Client client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);

  Future<bool> deleteInspirationFileInfo({
    required String fileInfoId,
  }) async {
    final databases = Databases(client);
    try {
      final data = await databases.deleteDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.inspirationsFilesCollectionID,
        documentId: fileInfoId,
      );
      log("Delete.deleteInspirationFileInfo");
      return true;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "delete.deleteInspirationFileInfo() null message");
      return false;
    }
  }

  Future<bool> savedDesignResource({
    required String docId,
  }) async {
    final databases = Databases(client);
    try {
      final data = await databases.deleteDocument(
        databaseId: AppWriteConst.usersDataDatabaseID,
        collectionId: AppWriteConst.savedDesignResourcesId,
        documentId: docId,
      );
      log("Delete.savedDesignResource");

      return true;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "delete.savedDesignResource() null message");
      return false;
    }
  }
}
