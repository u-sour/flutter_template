import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../router/route_utils.dart';
import '../services/auth_service.dart';
import '../services/route_service.dart';
import '../utils/responsive/responsive_layout.dart';
import 'drawer_header_widget.dart';
import 'drawer_list_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SCREENS> screens = SCREENS.values
        .where((screen) =>
            screen.toPath != "/splash" &&
            screen.toPath != "/start" &&
            screen.toPath != "form-builder-default" &&
            screen.toPath != "form-builder-validation" &&
            screen.toPath != "/login" &&
            screen.toPath != "/logout" &&
            screen.toPath != "/error")
        .toList();
    final SCREENS loginScreen =
        SCREENS.values.firstWhere((screen) => screen.toPath == "/logout");
    return Drawer(
        child: Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const DrawerHeaderWidget(),
              Expanded(
                child: ListView.builder(
                    itemCount: screens.length,
                    itemBuilder: (context, index) {
                      final IconData icon = screens[index].toIcon;
                      final String pathName = screens[index].toName;
                      return DrawerListTileWidget(
                          index: index,
                          icon: icon,
                          title: screens[index].toTitle,
                          onTap: () {
                            // Close Drawer (Mobile & Tablet)
                            if (!ResponsiveLayout.isDesktop(context)) {
                              context.pop();
                            }
                            // Go To Screen
                            context
                                .read<RouteService>()
                                .changeRouteIndexState(index);
                            context.goNamed(pathName);
                          });
                    }),
              )
            ],
          ),
        ),
        DrawerListTileWidget(
            icon: loginScreen.toIcon,
            title: loginScreen.toTitle,
            onTap: () => context.read<AuthService>().logOut()),
      ],
    ));
  }
}
