import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/signin_signup_screen.dart';
import 'package:help_me_design/views/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'constants/app_constants.dart';
import 'providers/snippet_tab_provider.dart';
import 'views/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(create: (_) => ThemeManager()),
        ChangeNotifierProvider<SnippetTabProvider>(create: (_) => SnippetTabProvider()),
        ChangeNotifierProvider<ComponentTabProvider>(create: (_) => ComponentTabProvider()),
        ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<ExploreTabProvider>(create: (_) => ExploreTabProvider()),
      ],
      child: Consumer2<ThemeManager, AuthService>(builder: (context, themeManagerProvider, authServiceProvider, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Help Me Design',
          darkTheme: darkTheme,
          theme: lightTheme,
          scaffoldMessengerKey: scaffoldMessengerKey,
          scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
          themeMode: themeManagerProvider.getThemeMode,
          // home: const MyHomePage(),
          // home: WelcomeScreen(),
          home: authServiceProvider.status == AuthStatus.unauthenticated
              ? const SignInSignUpScreen()
              : authServiceProvider.status == AuthStatus.authenticated
                  ? const MyHomePage()
                  : WelcomeScreen(),
          // home: WelcomeScreen(),
        );
      }),
    );
  }
}
