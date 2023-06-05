import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:favicon/favicon.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:html/parser.dart';
import 'package:image/image.dart' as img;

// import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

import 'package:http/http.dart' as http;

import '../../../theme/my_colors.dart';

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
    var themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        // child: Column(
        //   children: [
        //     IconButton(
        //       onPressed: () async {
        //         // setState(() {
        //         //   if (iconUrl != null) {
        //         //     imageUrl = iconUrl.url;
        //         //   }
        //         // });
        //         // -----------------------
        //         var uri = Uri.parse("http://localhost:3000/ico/google.com");
        //         // var uri2 = Uri.parse(
        //         //     "http://t2.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=https://www.stackoverflow.com&size=128");
        //         var response = await http.get(uri);

        //         if (response.statusCode == 404) {
        //           log("message:error");
        //           return;
        //         }

        //         print(response.bodyBytes.length);
        //         // print(response.bodyBytes);

        //         setState(() {
        //           uImage = response.bodyBytes;
        //         });
        //       },
        //       icon: Icon(Icons.add),
        //     ),
        //     IconButton(
        //       onPressed: () async {
        //         var uri = Uri.parse("http://localhost:3000/cors-proxy/stackoverflow.com");
        //         var response = await http.get(uri);

        //         final webScraper = WebScraper();
        //         if (await webScraper.loadFromString(response.body)) {
        //           List<Map<String, dynamic>> elements = webScraper.getElement('title', []);
        //           print(elements.first['title']);
        //         }

        //         // sendFile();
        //       },
        //       icon: Icon(Icons.nat),
        //     ),
        //     Text(imageUrl),
        //     uImage != null ? Image.memory(uImage!) : SizedBox(),
        //     imageUrl != 'def' ? Image.network(imageUrl) : SizedBox(),
        //   ],
        // ),
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 500,
                // padding: EdgeInsets.all(MySpaceSystem.spaceX3),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                  boxShadow: cardShadow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 500,
                      child: CustomPaint(
                        painter: ContainerSquarePatternTwoPainter(50, context),
                        child: Container(),
                      ),
                    ),
                    // Login Form
                    Container(
                      height: 300,
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name*', style: themeData.textTheme.titleMedium),
                          SizedBox(height: MySpaceSystem.spaceX2),
                          TextFormField(
                            // controller: nameEditingController,
                            cursorColor: MyColors.actionColor,
                            maxLines: 1,
                            style: MyTextTypeSystem.bodyXLarge.copyWith(decoration: TextDecoration.none),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: MyColors.secondaryTintColor,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3, vertical: MySpaceSystem.spaceX3),
                              hintText: 'Your name (required)',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: MyColors.secondaryShadeColor), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 2, color: MyColors.secondaryShadeColor), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text('LOgin')
            ],
          ),
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
