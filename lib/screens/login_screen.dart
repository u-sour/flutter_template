import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../router/route_utils.dart';
import '../services/auth_service.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(SCREENS.login.toTitle),
      ),
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
