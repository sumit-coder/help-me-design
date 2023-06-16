import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/email_validation.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/screens/home_screen/home_screen.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:help_me_design/views/widgets/divider_with_title.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/button_with_title_and_icon.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/email_input_field.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/password_input_field.dart';
import 'package:provider/provider.dart';

class VerificationView extends StatelessWidget {
  VerificationView({Key? key, required this.onTapSignUp}) : super(key: key);

  final VoidCallback onTapSignUp;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var authService = Provider.of<AuthService>(context);
    return Container(
      // height: 500,
      width: 424,
      // padding: EdgeInsets.all(MySpaceSystem.spaceX3),
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondary,
        boxShadow: cardShadow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: 424,
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
                    "Verification".toUpperCase(),
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
                SizedBox(height: MySpaceSystem.spaceX1),
                Text(
                  "Account Verification url sent to Your Email",
                  style: themeData.textTheme.titleSmall,
                ),
                SizedBox(height: MySpaceSystem.spaceX3),
                ButtonTapEffect(
                  onTap: () {
                    // var itemID = html.window.location.hash;

                    // print(itemID);
                    authService.createVerification();
                  },
                  child: Text(
                    "example@gmail.com ",
                    style: themeData.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: MySpaceSystem.spaceX3),
                DividerWithTitle(title: 'Thank You', margin: EdgeInsets.symmetric(vertical: MySpaceSystem.spaceX4)),
              ],
            ),
          )
        ],
      ),
    );
  }

  signInGithub(BuildContext context) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('64803e0044c9826d779b'); // Your project ID

    final account = Account(client);

    // Go to OAuth provider login page

    try {
      await account.createOAuth2Session(provider: 'github', success: "https://help-me-design.sumitpanwar.com");

      Navigator.pop(context);
      const snackbar = SnackBar(content: Text('Account created!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } on AppwriteException catch (e) {
      Navigator.pop(context);
    }

    // account.get();
    // account.deleteSession(sessionId: "current");
  }
}
