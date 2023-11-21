import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../router/route_utils.dart';
import '../services/auth_service.dart';
import '../widgets/app_bar_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.login.toTitle),
      body: Center(
        child: TextButton(
          onPressed: () {
            authService.login();
          },
          child: const Text("Log in"),
        ),
      ),
    );
  }
}
