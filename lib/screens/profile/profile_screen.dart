import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/widgets/screen_list_tile_widget_model.dart';
import '../../utils/responsive/responsive_layout.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../router/route_utils.dart';
import '../../widgets/screen_list_tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ScreenListTileWidgetModel> models = [
      ScreenListTileWidgetModel(
        icon: SCREENS.myProfile.toIcon,
        title: context.tr(SCREENS.myProfile.toTitle),
        onTap: () => context.goNamed(SCREENS.myProfile.toName),
      ),
      // ScreenListTileWidgetModel(
      //   icon: SCREENS.formBuilderValidation.toIcon,
      //   title: context.tr(SCREENS.formBuilderValidation.toTitle),
      //   onTap: () => context.goNamed(SCREENS.formBuilderValidation.toName),
      // )
    ];
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.formBuilder.toTitle),
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: ListView.builder(
            itemCount: models.length,
            itemBuilder: (context, index) {
              final model = models[index];
              return ScreenListTileWidget(model: model);
            },
          ),
        ),
      ]),
    );
  }
}
