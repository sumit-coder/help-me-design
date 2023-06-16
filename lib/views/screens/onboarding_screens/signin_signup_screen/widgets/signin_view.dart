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

class SignInView extends StatelessWidget {
  SignInView({Key? key, required this.onTapSignUp}) : super(key: key);

  final VoidCallback onTapSignUp;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  void sendToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var authService = Provider.of<AuthService>(context);
    return Container(
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
                EmailInputField(
                  emailEditingController: emailController,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                PasswordInputField(
                  isNeedVisibilityButton: true,
                  passwordEditingController: passwordController,
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
                  onTap: () async {
                    // if text is fields are empty sho error
                    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                      UtilityHelper.toastMessage(message: "Fill all the Fields");
                      return;
                    }
                    if (!isEmailValid(emailController.text)) {
                      UtilityHelper.toastMessage(message: "Email is InValid");
                      return;
                    }
                    // Try to SignIn User
                    await authService.createEmailSession(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    // if User id SignedIn and Send to Next Screen
                    if (authService.status == AuthStatus.authenticated) {
                      // Send To Next Screen;
                      UtilityHelper.toastMessage(message: "You Are in");
                      clearTextFields();

                      sendToHome(context);
                    }

                    // print(user.);
                  },
                ),

                DividerWithTitle(title: 'Continue With', margin: EdgeInsets.symmetric(vertical: MySpaceSystem.spaceX4)),

                Container(
                  // margin: EdgeInsets.only(top: MySpaceSystem.spaceX3),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonWithTitleAndIcon(
                          onTap: () {
                            // authService.createVerification();
                            UtilityHelper.toastMessage(message: "Google in is not working");
                          },
                          buttonTitle: "Google",
                          icon: Image.asset("assets/images/google-icon.png"),
                        ),
                      ),
                      SizedBox(width: MySpaceSystem.spaceX2),
                      Expanded(
                        child: ButtonWithTitleAndIcon(
                          onTap: () async {
                            signInGithub(context);
                          },
                          buttonTitle: "Github",
                          icon: Image.asset("assets/images/github-icon-light.png"),
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
                      onTap: () {
                        onTapSignUp();
                      },
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
    );
  }

  signInGithub(BuildContext context) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject('64803e0044c9826d779b'); // Your project ID

    final account = Account(client);

    // Go to OAuth provider login page

    try {
      await account.createOAuth2Session(provider: 'github', success: "https://help-me-design.netlify.app/#/");

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
