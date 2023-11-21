import 'package:flutter/material.dart';
import '../utils/responsive/responsive_layout.dart';
import '../widgets/app_bar_widget.dart';
import '../router/route_utils.dart';
import '../widgets/drawer_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.dashboard.toTitle),
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('dashboard'.toUpperCase()),
        ]),
      ),
    );
  }
}
