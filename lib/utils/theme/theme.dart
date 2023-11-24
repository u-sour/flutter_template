import 'package:flutter/material.dart';
import '../constants.dart';
import 'widgets/app_bar_theme_widget.dart';
import 'widgets/bottom_nav_bar_theme_widget.dart';
import 'widgets/elevated_button_theme_widget.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: AppThemeColors.primary,
      scaffoldBackgroundColor: AppThemeColors.scaffoldBgColor,
      fontFamily: AppThemeFonts.en,
      fontFamilyFallback: AppThemeFonts.fonts,
      appBarTheme: AppBarThemeWidget.light,
      elevatedButtonTheme: ElevatedThemeWidget.light,
      bottomNavigationBarTheme: BottomNavBarThemeWidget.light,
      listTileTheme: ListTileThemeData(selectedTileColor: Colors.grey.shade100),
      inputDecorationTheme:
          const InputDecorationTheme(border: OutlineInputBorder()));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: AppThemeColors.primary,
      fontFamily: AppThemeFonts.en,
      fontFamilyFallback: AppThemeFonts.fonts,
      appBarTheme: AppBarThemeWidget.dark,
      elevatedButtonTheme: ElevatedThemeWidget.dark,
      bottomNavigationBarTheme: BottomNavBarThemeWidget.dark,
      listTileTheme:
          const ListTileThemeData(selectedTileColor: Colors.white10));
}
