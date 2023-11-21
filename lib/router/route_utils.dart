import 'package:easy_localization/easy_localization.dart';
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
        return "screens.dashboard.title".tr();
      case SCREENS.formBuilder:
        return "screens.formBuilder.title".tr();
      case SCREENS.formBuilderTextField:
        return "screens.formBuilder.children.textField.title".tr();
      case SCREENS.profile:
        return "screens.profile.title".tr();
      case SCREENS.settings:
        return "screens.settings.title".tr();
      case SCREENS.login:
        return "screens.login.title".tr();
      case SCREENS.logout:
        return "screens.logout.title".tr();
      case SCREENS.splash:
        return "screens.splash.title".tr();
      case SCREENS.error:
        return "screens.error.title".tr();
      case SCREENS.onBoarding:
        return "screens.onBoarding.title".tr();
      default:
        return "screens.dashboard.title".tr();
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
