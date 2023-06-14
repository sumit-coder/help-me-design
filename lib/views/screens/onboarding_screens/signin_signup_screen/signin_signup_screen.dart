import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:favicon/favicon.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/theme/my_design_system.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/widgets/signup_view.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/widgets/verification_view.dart';
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

import 'widgets/signin_view.dart';

enum ActiveOnboardingView { signIn, signUp, resetPassword, none }

class SignInSignUpScreen extends StatefulWidget {
  const SignInSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignInSignUpScreen> createState() => _SignInSignUpScreenState();
}

class _SignInSignUpScreenState extends State<SignInSignUpScreen> {
  ActiveOnboardingView activeOnboardingView = ActiveOnboardingView.signIn;

  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var authService = Provider.of<AuthService>(context, listen: false);

    if (authService.status == AuthStatus.authenticated) {
      log("message");
    }
  }

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
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    // SignIn View
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInView(
                          onTapSignUp: () {
                            _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
                          },
                        ).animate().rotate(begin: -0.07, alignment: Alignment.bottomLeft),
                      ],
                    ),
                    // SignUp View
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignUpView(
                          onTapSignIn: () {
                            _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
                          },
                        ).animate().rotate(begin: -0.07, alignment: Alignment.bottomRight),
                      ],
                    ),

                    // Email Verification not been implemented right now
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       child: VerificationView(
                    //         onTapSignUp: () {},
                    //       ),
                    //       // onTapSignIn: () {
                    //       //   _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
                    //       // },
                    //     ).animate().rotate(begin: -0.07, alignment: Alignment.bottomCenter),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
