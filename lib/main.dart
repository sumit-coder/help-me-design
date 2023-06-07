import 'package:flutter/material.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_screen.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/signin_signup_screen.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signup_screen.dart';
import 'package:help_me_design/views/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'providers/snippet_tab_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(create: (_) => ThemeManager()),
        ChangeNotifierProvider<SnippetTabProvider>(create: (_) => SnippetTabProvider()),
        ChangeNotifierProvider<ComponentTabProvider>(create: (_) => ComponentTabProvider()),
      ],
      child: Consumer<ThemeManager>(builder: (context, value, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Help Me Design',
          darkTheme: darkTheme,
          theme: lightTheme,

          scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
          themeMode: Provider.of<ThemeManager>(context).getThemeMode,
          // home: const MyHomePage(),
          // home: const SignInScreen(),
          // home: SignUpScreen(),
          home: SignInSignUpScreen(),
          // home: WelcomeScreen(),
        );
      }),
    );
  }
}
