import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:favicon/favicon.dart';
import 'package:html/parser.dart';
import 'package:image/image.dart' as img;

// import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String imageUrl = 'def';
  Uint8List? uImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              onPressed: () async {
                // setState(() {
                //   if (iconUrl != null) {
                //     imageUrl = iconUrl.url;
                //   }
                // });
                // -----------------------
                var uri = Uri.parse("http://localhost:3000/ico/rockstar.com");
                var uri2 = Uri.parse(
                    "http://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.stackoverflow.com&size=128");
                var response = await http.get(uri);

                if (response.statusCode == 404) {
                  log("message:error");
                  return;
                }

                print(response.bodyBytes.length);
                // print(response.bodyBytes);

                setState(() {
                  uImage = response.bodyBytes;
                });
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () async {
                var uri = Uri.parse("http://localhost:3000/cors-proxy/stackoverflow.com");
                var response = await http.get(uri);

                final webScraper = WebScraper();
                if (await webScraper.loadFromString(response.body)) {
                  List<Map<String, dynamic>> elements = webScraper.getElement('title', []);
                  print(elements.first['title']);
                }

                // sendFile();
              },
              icon: Icon(Icons.nat),
            ),
            Text(imageUrl),
            uImage != null ? Image.memory(uImage!) : SizedBox(),
            imageUrl != 'def' ? Image.network(imageUrl) : SizedBox(),
          ],
        ),
      ),
    );
  }

  void sendFile() async {
    // Init SDK
    final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject('64646aa7e392b2267b90');

    final storage = Storage(client);

    final file = await storage.createFile(
      bucketId: '646aff96e9cde097637c',
      fileId: ID.unique(),
      file: InputFile.fromBytes(bytes: [...?uImage], filename: 'ico.png'),
    );
  }
}
