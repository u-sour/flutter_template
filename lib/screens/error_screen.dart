import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/route_utils.dart';

class ErrorScreen extends StatelessWidget {
  final String? error;
  const ErrorScreen({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SCREENS.error.toTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error ?? ""),
            TextButton(
              onPressed: () {
                GoRouter.of(context).goNamed(SCREENS.dashboard.toName);
              },
              child: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
