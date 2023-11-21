import 'package:flutter/material.dart';
import 'toggle_switch_theme_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Container(
          width: 120.0,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: const ToggleSwitchThemeWidget(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
