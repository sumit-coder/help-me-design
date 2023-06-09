import 'dart:convert';

import 'package:appwrite/models.dart';

class DesignResourcesCollection {
  late List<ResourceCollection> data;

  DesignResourcesCollection({required this.data});

  DesignResourcesCollection.fromJson(List<Document> listOfDocument) {
    data = <ResourceCollection>[];
    listOfDocument.forEach((element) {
      data.add(ResourceCollection.fromJson(element.data));
    });
  }
  DesignResourcesCollection.empty() {
    data = [];
  }
}

class ResourceCollection {
  late String title;
  late int resourcesCount;
  late String description;
  late List<ResourceData> resourcesList;

  ResourceCollection({required this.title, required this.resourcesCount, required this.description, required this.resourcesList});

  ResourceCollection.fromJson(Map<String, dynamic> json) {
    title = json['resourceTitle'] ?? "Def";
    description = json['resourceDescription'] ?? "Def";
    resourcesCount = json['resourcesCount'] ?? 0;
    if (json['resourcesList'] != null) {
      resourcesList = <ResourceData>[];
      json['resourcesList'].forEach((v) {
        resourcesList.add(ResourceData.fromJson(jsonDecode(v)));
      });
    } else {
      resourcesList = [];
    }
  }
}

class ResourceData {
  late String title;
  late String url;
  late String description;

  ResourceData({required this.title, required this.url, required this.description});

  ResourceData.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "def";
    description = json['description'] ?? "def";
    url = json['url'] ??
        "https://cloud.appwrite.io/v1/storage/buckets/6482afbec552c0b290c2/files/6482b0100736812c133a/view?project=64803e0044c9826d779b";
  }
}
