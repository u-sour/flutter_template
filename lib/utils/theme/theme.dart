import 'package:flutter/material.dart';
import 'package:flutter_template/utils/theme/widgets/filled_button_theme_widget.dart';
import '../constants.dart';
import 'widgets/app_bar_theme_widget.dart';
import 'widgets/bottom_nav_bar_theme_widget.dart';
import 'widgets/elevated_button_theme_widget.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: AppThemeColors.primary,
    fontFamily: AppThemeFonts.en,
    fontFamilyFallback: AppThemeFonts.fonts,
    appBarTheme: AppBarThemeWidget.light,
    elevatedButtonTheme: ElevatedThemeWidget.light,
    filledButtonTheme: FilledThemeWidget.light,
    bottomNavigationBarTheme: BottomNavBarThemeWidget.light,
    listTileTheme:
        const ListTileThemeData(selectedTileColor: AppThemeColors.primary),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppThemeColors.primary,
    fontFamily: AppThemeFonts.en,
    fontFamilyFallback: AppThemeFonts.fonts,
    appBarTheme: AppBarThemeWidget.dark,
    elevatedButtonTheme: ElevatedThemeWidget.dark,
    filledButtonTheme: FilledThemeWidget.dark,
    bottomNavigationBarTheme: BottomNavBarThemeWidget.dark,
    listTileTheme: const ListTileThemeData(selectedTileColor: Colors.white10),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
