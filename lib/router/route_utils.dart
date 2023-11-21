import 'package:flutter/material.dart';
import '../utils/constants.dart';

enum SCREENS {
  splash,
  onBoarding,
  login,
  dashboard,
  formBuilder,
  formBuilderTextField,
  profile,
  settings,
  logout,
  error
}

extension AppScreenExtension on SCREENS {
  String get toPath {
    switch (this) {
      case SCREENS.dashboard:
        return "/";
      case SCREENS.formBuilder:
        return "/form-builder";
      case SCREENS.formBuilderTextField:
        return "text-field";
      case SCREENS.profile:
        return "/profile";
      case SCREENS.settings:
        return "/settings";
      case SCREENS.login:
        return "/login";
      case SCREENS.logout:
        return "/logout";
      case SCREENS.splash:
        return "/splash";
      case SCREENS.error:
        return "/error";
      case SCREENS.onBoarding:
        return "/start";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case SCREENS.dashboard:
        return "dashboard";
      case SCREENS.formBuilder:
        return "formBuilder";
      case SCREENS.formBuilderTextField:
        return "formBuilderTextField";
      case SCREENS.profile:
        return "profile";
      case SCREENS.settings:
        return "settings";
      case SCREENS.login:
        return "login";
      case SCREENS.splash:
        return "splash";
      case SCREENS.error:
        return "error";
      case SCREENS.onBoarding:
        return "start";
      default:
        return "dashboard";
    }
  }

  String get toTitle {
    switch (this) {
      case SCREENS.dashboard:
        return "screens.dashboard.title";
      case SCREENS.formBuilder:
        return "screens.formBuilder.title";
      case SCREENS.formBuilderTextField:
        return "screens.formBuilder.children.textField.title";
      case SCREENS.profile:
        return "screens.profile.title";
      case SCREENS.settings:
        return "screens.settings.title";
      case SCREENS.login:
        return "screens.login.title";
      case SCREENS.logout:
        return "screens.logout.title";
      case SCREENS.splash:
        return "screens.splash.title";
      case SCREENS.error:
        return "screens.error.title";
      case SCREENS.onBoarding:
        return "screens.onBoarding.title";
      default:
        return "screens.dashboard.title";
    }
  }

  IconData get toIcon {
    switch (this) {
      case SCREENS.dashboard:
        return AppDefaultIcons.dashboard;
      case SCREENS.formBuilder:
        return AppDefaultIcons.fromBuilder;
      case SCREENS.formBuilderTextField:
        return AppDefaultIcons.fromBuilderTextField;
      case SCREENS.profile:
        return AppDefaultIcons.profile;
      case SCREENS.settings:
        return AppDefaultIcons.settings;
      case SCREENS.login:
        return AppDefaultIcons.login;
      case SCREENS.logout:
        return AppDefaultIcons.logout;
      case SCREENS.splash:
        return AppDefaultIcons.splashScreen;
      case SCREENS.error:
        return AppDefaultIcons.error;
      case SCREENS.onBoarding:
        return AppDefaultIcons.onBoarding;
      default:
        return AppDefaultIcons.dashboard;
    }
  }
}
