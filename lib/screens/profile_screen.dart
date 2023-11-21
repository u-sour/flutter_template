import 'package:flutter/material.dart';
import '../utils/responsive/responsive_layout.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../router/route_utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.profile.toTitle),
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('profile'.toUpperCase()),
        ]),
      ),
    );
  }
}
