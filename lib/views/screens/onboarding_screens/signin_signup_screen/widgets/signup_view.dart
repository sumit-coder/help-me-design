import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/utility/email_validation.dart';
import 'package:help_me_design/utility/utility_helper.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:help_me_design/views/widgets/divider_with_title.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/button_with_title_and_icon.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/email_input_field.dart';
import 'package:help_me_design/views/widgets/form_widgets/input_fields/password_input_field.dart';

// import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key, required this.onTapSignIn}) : super(key: key);

  final VoidCallback onTapSignIn;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  clearTextFields() {
    emailController.clear();
    passwordController.clear();
    conformPasswordController.clear();
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
                    "Sign Up".toUpperCase(),
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
                  passwordEditingController: passwordController,
                ),
                SizedBox(height: MySpaceSystem.spaceX2),
                PasswordInputField(
                  customHintText: "Conform Password",
                  passwordEditingController: conformPasswordController,
                ),

                SizedBox(height: MySpaceSystem.spaceX3),
                SimpleButton(
                  buttonTitle: "Sign Up",
                  onTap: () async {
                    // if text is fields are empty sho error
                    if (emailController.text.isEmpty || passwordController.text.isEmpty || conformPasswordController.text.isEmpty) {
                      UtilityHelper.toastMessage(message: "Fill all the Fields");
                      return;
                    }
                    if (!isEmailValid(emailController.text)) {
                      UtilityHelper.toastMessage(message: "Email is InValid");
                      return;
                    }
                    if (passwordController.text != conformPasswordController.text) {
                      UtilityHelper.toastMessage(message: "Password don't Match");
                      return;
                    }
                    if (passwordController.text.length < 8) {
                      UtilityHelper.toastMessage(message: "Password Must be at least 8 chars");
                      return;
                    }

                    User? userInfo = await authService.createUser(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (userInfo != null) {
                      clearTextFields();
                      UtilityHelper.toastMessage(
                        message: "SignUp is Successful, SignIn Now",
                        msgDuration: Duration(seconds: 3),
                      );
                      // authService.createVerification();
                      // send user to signIn View
                      onTapSignIn();
                    }
                    print("object");
                  },
                ),

                DividerWithTitle(
                  title: 'Continue With',
                  margin: EdgeInsets.symmetric(vertical: MySpaceSystem.spaceX4),
                ),

                Container(
                  // margin: EdgeInsets.only(top: MySpaceSystem.spaceX3),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonWithTitleAndIcon(
                          onTap: () {
                            // authService.signOut();
                            UtilityHelper.toastMessage(message: "Google in is not working");
                          },
                          buttonTitle: "Google",
                          icon: Image.asset("assets/images/google-icon.png"),
                        ),
                      ),
                      SizedBox(width: MySpaceSystem.spaceX2),
                      Expanded(
                        child: ButtonWithTitleAndIcon(
                          onTap: () {
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
                    Text("Already have an account? ", style: themeData.textTheme.bodyMedium),
                    ButtonTapEffect(
                      onTap: () {
                        onTapSignIn();
                      },
                      child: Text(
                        "Sign In".toUpperCase(),
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
