import 'package:flutter/material.dart';
import 'package:help_me_design/theme/my_theme.dart';
import 'package:provider/provider.dart';

import 'views/screens/home_screen/home_screen.dart';

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
      ],
      child: Consumer<ThemeManager>(builder: (context, value, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Help Me Design',
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: Provider.of<ThemeManager>(context).getThemeMode,
          home: const MyHomePage(),
        );
      }),
    );
  }
}
