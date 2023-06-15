import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/signin_signup_screen.dart';
import 'package:help_me_design/views/widgets/button_tap_effect.dart';

class SignInAlertCard extends StatelessWidget {
  const SignInAlertCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(MySpaceSystem.spaceX3),
      decoration: BoxDecoration(
        boxShadow: cardShadow,
        color: themeData.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      // width: 300,
      // height: 234,
      child: Column(
        children: [
          Text('Sign In Alert', style: themeData.textTheme.titleMedium),
          SizedBox(height: MySpaceSystem.spaceX4),
          Text('SignIn to Access Saved Sections', style: themeData.textTheme.bodyLarge),
          SizedBox(height: MySpaceSystem.spaceX4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTapEffect(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: cardShadow,
                    color: themeData.colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                    // border: Border.all(
                    //     // color: Colors.black,
                    //     ),
                  ),
                  width: 154,
                  height: 48,
                  child: Center(
                    child: Text('Cancel', style: themeData.textTheme.bodyLarge),
                  ),
                ),
              ),
              SizedBox(width: MySpaceSystem.spaceX2),
              ButtonTapEffect(
                onTap: () {
                  Navigator.pop(context);
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
                    color: themeData.colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
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
    );
  }
}
