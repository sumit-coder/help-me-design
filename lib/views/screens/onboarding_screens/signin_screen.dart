import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:favicon/favicon.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:help_me_design/views/widgets/divider_with_title.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/button_with_title_and_icon.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/email_input_field.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/password_input_field.dart';
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
                width: 374,
                // padding: EdgeInsets.all(MySpaceSystem.spaceX3),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.secondary,
                  boxShadow: cardShadow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 374,
                      height: 100,
                      child: CustomPaint(
                        painter: ContainerPatternPainter(42, context),
                        child: Container(
                          padding: EdgeInsets.all(MySpaceSystem.spaceX3),
                          alignment: Alignment.topLeft,
                          child: Container(
                            color: themeData.colorScheme.primary,
                            padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX2, vertical: MySpaceSystem.spaceX1),
                            child: Text(
                              "Sign In".toUpperCase(),
                              style: MyTextTypeSystem.titleXLargeDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MySpaceSystem.spaceX1),
                    // Login Form
                    Container(
                      padding: EdgeInsets.all(MySpaceSystem.spaceX4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text('Email*', style: themeData.textTheme.titleSmall),
                          // SizedBox(height: MySpaceSystem.spaceX1),
                          EmailInputField(
                            emailEditingController: TextEditingController(),
                          ),
                          SizedBox(height: MySpaceSystem.spaceX2),
                          PasswordInputField(
                            passwordEditingController: TextEditingController(),
                          ),
                          SizedBox(height: MySpaceSystem.spaceX2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonTapEffect(
                                onTap: () {},
                                child: Text(
                                  "Forgot password",
                                  style: themeData.textTheme.bodySmall!.copyWith(color: themeData.colorScheme.primary),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: MySpaceSystem.spaceX3),
                          SimpleButton(
                            buttonTitle: "Sign In",
                            onTap: () {
                              print("object");
                            },
                          ),

                          DividerWithTitle(title: 'Continue With', margin: EdgeInsets.symmetric(vertical: MySpaceSystem.spaceX4)),

                          Container(
                            // margin: EdgeInsets.only(top: MySpaceSystem.spaceX3),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ButtonWithTitleAndIcon(
                                    onTap: () {},
                                    buttonTitle: "Google",
                                    icon: Image.asset("assets/images/google-icon.png"),
                                  ),
                                ),
                                SizedBox(width: MySpaceSystem.spaceX2),
                                Expanded(
                                  child: ButtonWithTitleAndIcon(
                                    onTap: () {},
                                    buttonTitle: "Github",
                                    icon: Image.asset("assets/images/github-icon.png"),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(height: 64)
                          SizedBox(height: MySpaceSystem.spaceX4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ", style: themeData.textTheme.bodyMedium),
                              ButtonTapEffect(
                                onTap: () {},
                                child: Text(
                                  "Sign Up".toUpperCase(),
                                  style: themeData.textTheme.bodyMedium!.copyWith(color: themeData.colorScheme.primary),
                                ),
                              )
                            ],
                          ),
                        ],
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
