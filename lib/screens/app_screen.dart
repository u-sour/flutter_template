import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../router/app_router.dart';
import '../services/app_service.dart';
import '../services/auth_service.dart';
import '../services/route_service.dart';
import '../services/theme_service.dart';
import '../utils/theme/theme.dart';

class AppScreen extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const AppScreen({
    super.key,
    required this.sharedPreferences,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late AppService appService;
  late ThemeService themeService;
  late RouteService routeService;
  late AuthService authService;
  late StreamSubscription<bool> authSubscription;

  @override
  void initState() {
    appService = AppService(widget.sharedPreferences);
    themeService = ThemeService();
    routeService = RouteService();
    authService = AuthService();
    authSubscription = authService.onAuthStateChange.listen(onAuthStateChange);
    super.initState();
  }

  void onAuthStateChange(bool login) {
    appService.loginState = login;
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppService>(create: (_) => appService),
        ChangeNotifierProvider<ThemeService>(create: (_) => themeService),
        ChangeNotifierProvider<RouteService>(create: (_) => routeService),
        Provider<AppRouter>(create: (_) => AppRouter(appService)),
        Provider<AuthService>(create: (_) => authService),
      ],
      child: Builder(
        builder: (context) {
          final GoRouter goRouter = context.read<AppRouter>().router;
          return Consumer<ThemeService>(builder: (context, state, child) {
            return MaterialApp.router(
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              title: "Flutter Template",
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              routerConfig: goRouter,
            );
          });
        },
      ),
    );
  }
}
