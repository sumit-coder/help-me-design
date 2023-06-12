import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants_all.dart';

class StorageService {
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
