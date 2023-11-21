import 'package:flutter/material.dart';
import '../models/select-option/select_option_model.dart';

class AppThemeColors {
  AppThemeColors._();
  static const MaterialColor primary = MaterialColor(0xFF212529, {
    50: Color.fromRGBO(33, 37, 41, .1),
    100: Color.fromRGBO(33, 37, 41, .2),
    200: Color.fromRGBO(33, 37, 41, .3),
    300: Color.fromRGBO(33, 37, 41, .4),
    400: Color.fromRGBO(33, 37, 41, .5),
    500: Color.fromRGBO(33, 37, 41, .6),
    600: Color.fromRGBO(33, 37, 41, .7),
    700: Color.fromRGBO(33, 37, 41, .8),
    800: Color.fromRGBO(33, 37, 41, .9),
    900: Color.fromRGBO(33, 37, 41, 1)
  });

  static const scaffoldBgColor = Color(0xFFe9ecef);
}

class AppStyleDefaultProperties {
  AppStyleDefaultProperties._();
  static const double radius = 10.0;
}

class AppDefaultIcons {
  AppDefaultIcons._();
  // Navigations
  static const IconData splashScreen = Icons.scale_sharp;
  static const IconData onBoarding = Icons.web;
  static const IconData dashboard = Icons.dashboard;
  static const IconData fromBuilder = Icons.input;
  static const IconData fromBuilderTextField = Icons.format_color_text;
  static const IconData profile = Icons.face;
  static const IconData settings = Icons.settings;
  static const IconData login = Icons.login;
  static const IconData logout = Icons.logout;
  static const IconData error = Icons.error;
  // Widgets
  static const IconData theme = Icons.palette;
  static const IconData language = Icons.language;
  // Themes
  static const IconData autoTheme = Icons.brightness_auto;
  static const IconData lightTheme = Icons.light_mode;
  static const IconData darkTheme = Icons.dark_mode;
}

class AppThemes {
  AppThemes._();
  static const List<SelectOptionModel> themes = [
    SelectOptionModel(
        icon: AppDefaultIcons.lightTheme,
        label: 'screens.settings.children.theme.options.light',
        value: ThemeMode.light),
    SelectOptionModel(
        icon: AppDefaultIcons.darkTheme,
        label: 'screens.settings.children.theme.options.dark',
        value: ThemeMode.dark),
    SelectOptionModel(
        icon: AppDefaultIcons.autoTheme,
        label: 'screens.settings.children.theme.options.auto',
        value: ThemeMode.system),
  ];
}

class AppSupportedLocales {
  AppSupportedLocales._();
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('km', 'KH')
  ];
  static Locale get en => supportedLocales.first;
  static Locale get km => supportedLocales.last;
}

class AppSupportedLanguages {
  AppSupportedLanguages._();
  static final List<SelectOptionModel> supportedLanguages = [
    SelectOptionModel(
        label: 'screens.settings.children.language.options.en',
        value: AppSupportedLocales.en),
    SelectOptionModel(
        label: 'screens.settings.children.language.options.km',
        value: AppSupportedLocales.km)
  ];
}

class AppThemeFonts {
  AppThemeFonts._();
  static const List<String> fonts = ['Poppins', 'Kantumruy Pro'];
  static String get en => fonts.first;
  static String get km => fonts.last;
}
