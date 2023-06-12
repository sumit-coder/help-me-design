import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants_all.dart';

class StorageService {
  static UploadFile upload = UploadFile();
  static DeleteFile delete = DeleteFile();
}

class UploadFile {
  final client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);
  Future<File?> uploadInspirationsFile(List<int> bytes, String fileName) async {
    final storage = Storage(client);

    try {
      final file = await storage.createFile(
        bucketId: AppWriteConst.usersInspirationFilesBucketId,
        fileId: ID.unique(),
        file: InputFile.fromBytes(bytes: bytes, filename: fileName),
      );
      log("createFile.uploadInspirationsFile");
      return file;
    } on AppwriteException catch (e) {
      print(e);
    }
  }
}

class DeleteFile {
  final client = Client()
      .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
      .setProject(AppWriteConst.APPWRITE_PROJECT_ID);
  Future<bool> deleteInspirationFile({required String fileId}) async {
    final storage = Storage(client);

    try {
      final file = await storage.deleteFile(
        bucketId: AppWriteConst.usersInspirationFilesBucketId,
        fileId: fileId,
      );
      log("delete.deleteInspirationFile");
      return true;
    } on AppwriteException catch (e) {
      print(e);
      return false;
    }
  }
}
