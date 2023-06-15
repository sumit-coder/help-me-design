import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/home_screen/home_screen.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/signin_signup_screen.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';
import 'package:help_me_design/views/widgets/container_pattern_painter.dart';
import 'package:help_me_design/views/widgets/form_widgets/buttons/simple_button.dart';

import '../theme/my_colors.dart';
import '../theme/my_design_system.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(child: Center(child: CircularProgressIndicator(color: DesignSystemColors.secondaryColorDark))),
            Positioned(
              // top: 100,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color(0xFF13121B),
                height: size.height * 0.64,
                child: Image.asset('assets/images/welcome-poster.png'),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: size.height * 0.64,
              child: CustomPaint(
                painter: WelcomeScreenPatternThreePainter(84, context),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: MySpaceSystem.spaceX2),
                      Container(
                        color: themeData.colorScheme.primary,
                        padding: EdgeInsets.symmetric(horizontal: MySpaceSystem.spaceX2),
                        child: Text(
                          "Help Me Design",
                          style: MyTextTypeSystem.titleXXLargeDark.copyWith(
                            fontSize: 34,
                            backgroundColor: themeData.colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: MySpaceSystem.spaceX2),
                      Container(
                        width: 600,
                        // color: themeData.colorScheme.primary,
                        child: Text(
                          "\" to Help Developers Design Better Products. This app is built for the developer to explore design resources & Save code\"",
                          textAlign: TextAlign.center,
                          style: MyTextTypeSystem.titleLargeDark.copyWith(backgroundColor: themeData.colorScheme.primary),
                        ),
                      ),
                      SizedBox(height: MySpaceSystem.spaceX4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTapEffect(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MyHomePage();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: cardShadow,
                                color: themeData.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                                // border: Border.all(
                                //     // color: Colors.black,
                                //     ),
                              ),
                              width: 154,
                              height: 48,
                              child: Center(
                                child: Text('Explore', style: themeData.textTheme.bodyLarge),
                              ),
                            ),
                          ),
                          SizedBox(width: MySpaceSystem.spaceX3),
                          ButtonTapEffect(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignInSignUpScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: cardShadow,
                                color: themeData.colorScheme.secondary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 158,
                              height: 48,
                              child: Center(
                                child: Text('SignIn', style: themeData.textTheme.bodyLarge),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
