import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/form-builder/form-builder-fields/form_builer_text_field_screen.dart';
import 'route_utils.dart';
import '../services/app_service.dart';
import '../screens/error_screen.dart';
import '../screens/main_wrapper_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/form-builder/form_builder_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  late final AppService appService;
  GoRouter get router => _goRouter;

  AppRouter(this.appService);

  // Private Navigators Keys
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorFormBuilder =
      GlobalKey<NavigatorState>(debugLabel: 'shellFormBuilder');
  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
  static final _rootNavigatorSettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appService,
    initialLocation: SCREENS.dashboard.toPath,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      // Main Wrapper Route
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainWrapperScreen(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            // Dashboard
            StatefulShellBranch(navigatorKey: _rootNavigatorHome, routes: [
              GoRoute(
                path: SCREENS.dashboard.toPath,
                name: SCREENS.dashboard.toName,
                builder: (context, state) => const DashboardScreen(),
              ),
            ]),
            // Form Builder
            StatefulShellBranch(
                navigatorKey: _rootNavigatorFormBuilder,
                routes: [
                  GoRoute(
                      path: SCREENS.formBuilder.toPath,
                      name: SCREENS.formBuilder.toName,
                      builder: (context, state) => const FormBuilderScreen(),
                      routes: [
                        GoRoute(
                          path: SCREENS.formBuilderTextField.toPath,
                          name: SCREENS.formBuilderTextField.toName,
                          builder: (context, state) =>
                              FormBuilderTextFieldScreen(key: state.pageKey),
                        ),
                      ]),
                ]),
            // Profile
            StatefulShellBranch(navigatorKey: _rootNavigatorProfile, routes: [
              GoRoute(
                path: SCREENS.profile.toPath,
                name: SCREENS.profile.toName,
                builder: (context, state) => const ProfileScreen(),
              ),
            ]),
            // Settings
            StatefulShellBranch(navigatorKey: _rootNavigatorSettings, routes: [
              GoRoute(
                path: SCREENS.settings.toPath,
                name: SCREENS.settings.toName,
                builder: (context, state) => const SettingsScreen(),
              ),
            ])
          ]),
      GoRoute(
        path: SCREENS.splash.toPath,
        name: SCREENS.splash.toName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: SCREENS.login.toPath,
        name: SCREENS.login.toName,
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        path: SCREENS.onBoarding.toPath,
        name: SCREENS.onBoarding.toName,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: SCREENS.error.toPath,
        name: SCREENS.error.toName,
        builder: (context, state) => ErrorScreen(error: state.extra.toString()),
      ),
    ],
    errorBuilder: (context, state) =>
        ErrorScreen(error: state.error.toString()),
    redirect: (context, state) {
      final loginLocation = state.namedLocation(SCREENS.login.toName);
      final dashboardLocation = state.namedLocation(SCREENS.dashboard.toName);
      final splashLocation = state.namedLocation(SCREENS.splash.toName);
      final onboardLocation = state.namedLocation(SCREENS.onBoarding.toName);

      final isLogedIn = appService.loginState;
      final isInitialized = appService.initialized;
      final isOnboarded = appService.onboarding;

      final isGoingToLogin = state.matchedLocation == loginLocation;
      final isGoingToInit = state.matchedLocation == splashLocation;
      final isGoingToOnboard = state.matchedLocation == onboardLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      if (!isInitialized && !isGoingToInit) {
        return splashLocation;
        // If not onboard and not going to onboard redirect to OnBoarding
      } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
        return onboardLocation;
        // If not logedin and not going to login redirect to Login
      } else if (isInitialized &&
          isOnboarded &&
          !isLogedIn &&
          !isGoingToLogin) {
        return loginLocation;
        // If all the scenarios are cleared but still going to any of that screen redirect to Dashboard
      } else if ((isLogedIn && isGoingToLogin) ||
          (isInitialized && isGoingToInit) ||
          (isOnboarded && isGoingToOnboard)) {
        return dashboardLocation;
      } else {
        // Else Don't do anything
        return null;
      }
    },
  );
}
