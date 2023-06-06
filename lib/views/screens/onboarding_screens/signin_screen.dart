import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:favicon/favicon.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:html/parser.dart';
import 'package:image/image.dart' as img;

// import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    var themeMangerProvider = Provider.of<ThemeManager>(context, listen: false);
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
                // height: 500,
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
                        child: Container(
                          padding: EdgeInsets.all(MySpaceSystem.spaceX3),
                        ),
                      ),
                    ),
                    // Login Form
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(MySpaceSystem.spaceX3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: MySpaceSystem.spaceX5),
                              child: Text("Sign In".toUpperCase(), style: themeData.textTheme.titleLarge),
                            ),

                            // Text('Email*', style: themeData.textTheme.titleSmall),
                            // SizedBox(height: MySpaceSystem.spaceX1),
                            TextFormField(
                              // controller: nameEditingController,
                              cursorColor: MyColors.actionColor,
                              maxLines: 1,
                              style: themeData.textTheme.bodyLarge!.copyWith(decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: themeData.colorScheme.secondary,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3, vertical: MySpaceSystem.spaceX3),
                                hintText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: themeData.colorScheme.outline), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: themeData.colorScheme.primary), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            SizedBox(height: MySpaceSystem.spaceX2),
                            TextFormField(
                              // controller: nameEditingController,
                              cursorColor: MyColors.actionColor,
                              maxLines: 1,
                              style: themeData.textTheme.bodyLarge!.copyWith(decoration: TextDecoration.none),
                              decoration: InputDecoration(
                                suffixIcon: ButtonTapEffect(
                                  margin: EdgeInsets.only(right: 4),
                                  onTap: () {},
                                  child: Icon(Icons.visibility_off_rounded, color: themeData.colorScheme.outline),
                                ),
                                filled: true,
                                fillColor: themeData.colorScheme.secondary,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX3, vertical: MySpaceSystem.spaceX3),
                                hintText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: themeData.colorScheme.outline), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: themeData.colorScheme.primary), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                            SizedBox(height: MySpaceSystem.spaceX3),
                            ButtonTapEffect(
                              onTap: () {},
                              child: Container(
                                height: 44,
                                padding: EdgeInsets.all(MySpaceSystem.spaceX2),
                                decoration: BoxDecoration(
                                  color: themeData.colorScheme.primary,
                                  // color: themeData.colorScheme.secondary,
                                  boxShadow: cardShadow,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(child: Text("Sign In", style: MyTextTypeSystem.bodyLarge)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: MySpaceSystem.spaceX4),
                              child: Row(
                                children: [
                                  Expanded(child: Divider(thickness: 1, color: themeData.colorScheme.outline)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX1),
                                    child: Text("Continue With", style: themeData.textTheme.bodySmall),
                                  ),
                                  Expanded(child: Divider(thickness: 1, height: 1, color: themeData.colorScheme.outline)),
                                ],
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(top: MySpaceSystem.spaceX3),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ButtonTapEffect(
                                      onTap: () {},
                                      child: Container(
                                        height: 44,
                                        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
                                        decoration: BoxDecoration(
                                          color: themeData.colorScheme.primary,
                                          // color: themeData.colorScheme.secondary,
                                          boxShadow: cardShadow,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/google-icon.png"),
                                            SizedBox(width: MySpaceSystem.spaceX1),
                                            Text("Google", style: MyTextTypeSystem.bodyLarge),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: MySpaceSystem.spaceX2),
                                  Expanded(
                                    child: ButtonTapEffect(
                                      onTap: () {},
                                      child: Container(
                                        height: 44,
                                        padding: EdgeInsets.all(MySpaceSystem.spaceX2),
                                        decoration: BoxDecoration(
                                          color: themeData.colorScheme.primary,
                                          // color: themeData.colorScheme.secondary,
                                          boxShadow: cardShadow,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                            child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(24),
                                              child: Image.asset("assets/images/github-icon.png"),
                                            ),
                                            SizedBox(width: MySpaceSystem.spaceX1),
                                            Text("Github", style: MyTextTypeSystem.bodyLarge),
                                          ],
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(height: 64)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ButtonTapEffect(
                  onTap: () {
                    if (themeMangerProvider.isDarkMode) {
                      themeMangerProvider.changeThemeMode(ThemeMode.light);
                      setState(() {});
                      return;
                    }
                    themeMangerProvider.changeThemeMode(ThemeMode.dark);
                    setState(() {});

                    print(themeMangerProvider.getThemeMode);
                  },
                  child: Text('LOgin'))
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
