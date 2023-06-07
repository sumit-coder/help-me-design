import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
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

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var themeMangerProvider = Provider.of<ThemeManager>(context, listen: false);
    return Scaffold(
      body: SafeArea(
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
                            emailEditingController: TextEditingController(),
                          ),
                          SizedBox(height: MySpaceSystem.spaceX2),
                          PasswordInputField(
                            passwordEditingController: TextEditingController(),
                          ),
                          SizedBox(height: MySpaceSystem.spaceX2),
                          PasswordInputField(
                            customHintText: "Conform Password",
                            passwordEditingController: TextEditingController(),
                          ),

                          SizedBox(height: MySpaceSystem.spaceX3),
                          SimpleButton(
                            buttonTitle: "Sign Up",
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
                              Text("Already have an account? ", style: themeData.textTheme.bodyMedium),
                              ButtonTapEffect(
                                onTap: () {},
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
              ),
              ButtonTapEffect(
                  onTap: () {
                    if (themeMangerProvider.isDarkMode) {
                      themeMangerProvider.changeThemeMode(ThemeMode.light);

                      return;
                    }
                    themeMangerProvider.changeThemeMode(ThemeMode.dark);

                    print(themeMangerProvider.getThemeMode);
                  },
                  child: Text('LOgin'))
            ],
          ),
        ),
      ),
    );
  }
}
