import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:help_me_design/appwrite_service/auth_service.dart';
import 'package:help_me_design/providers/component_tab_provider/component_tab_provider.dart';
import 'package:help_me_design/providers/explore_tab_provider/explore_tab_provider.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:help_me_design/views/screens/onboarding_screens/signin_signup_screen/signin_signup_screen.dart';
import 'package:help_me_design/views/welcome_screen.dart';
import 'package:provider/provider.dart';

import 'constants/app_constants.dart';
import 'providers/inspiration_tab_provider/inspiration_tab_provider.dart';
import 'providers/snippet_tab_provider/snippet_tab_provider.dart';
import 'views/screens/home_screen/home_screen.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
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
    Animate.restartOnHotReload = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(create: (_) => ThemeManager()),
        ChangeNotifierProvider<SnippetTabProvider>(create: (_) => SnippetTabProvider()),
        ChangeNotifierProvider<ComponentTabProvider>(create: (_) => ComponentTabProvider()),
        ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<ExploreTabProvider>(create: (_) => ExploreTabProvider()),
        ChangeNotifierProvider<InspirationTabProvider>(create: (_) => InspirationTabProvider()),
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
