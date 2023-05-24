import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';
import 'my_design_system.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool isDarkMode = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark; //get initial value

  // get isDarkMode => _isDarkMode;

  get getThemeMode => _themeMode;

  // ThemeMode get getThemeMode => _themeMode;

  changeThemeMode(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    isDarkMode = newThemeMode == ThemeMode.dark;

    if (isDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF1A1A1A), // status bar color
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFFFFFFF), // status bar color
        ),
      );
    }

    // changeStatusBarAndBottomBar(_isDarkMode ? DarkThemeColors.primaryColor : LightThemeColors.primaryColor);

    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  // textTheme: GoogleFonts.poppinsTextTheme(),
  textTheme: TextTheme(
    titleLarge: MyTextTypeSystem.titleXLargeDark,
    titleMedium: MyTextTypeSystem.titleLargeDark,
    titleSmall: MyTextTypeSystem.titleMediumDark,
    bodyLarge: MyTextTypeSystem.bodyLargeDark,
    bodyMedium: MyTextTypeSystem.bodyMediumDark,
    bodySmall: MyTextTypeSystem.bodySmallDark,
  ),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: DesignSystemColors.primaryColor,
    primary: DesignSystemColors.primaryColor,
    secondary: DesignSystemColors.secondaryColor,
    onSecondary: Color.fromARGB(255, 216, 216, 216),
    tertiary: DesignSystemColors.actionColor,
    outline: DesignSystemColors.outlineColor,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  // textTheme: GoogleFonts.poppinsTextTheme(),
  textTheme: TextTheme(
    titleLarge: MyTextTypeSystem.titleXLarge,
    titleMedium: MyTextTypeSystem.titleLarge,
    titleSmall: MyTextTypeSystem.titleMedium,
    bodyLarge: MyTextTypeSystem.bodyLarge,
    bodyMedium: MyTextTypeSystem.bodyMedium,
    bodySmall: MyTextTypeSystem.bodySmall,
  ),
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: DesignSystemColors.primaryColorDark,
    primary: DesignSystemColors.primaryColorDark,
    secondary: DesignSystemColors.secondaryColorDark,
    onSecondary: Color.fromARGB(255, 12, 12, 12),
    tertiary: DesignSystemColors.actionColor,
    outline: DesignSystemColors.outlineColorDark,
  ),
);

List<BoxShadow> cardShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.15),
    spreadRadius: 0.8,
    blurRadius: 0.8,
    offset: const Offset(0, 1),
  ),
];

changeStatusBarColor(Color bgColor) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: bgColor, // navigation bar color
    ),
  );
}

changeNavigationBarColor(Color bgColor) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: bgColor, // status bar color
    ),
  );
}
