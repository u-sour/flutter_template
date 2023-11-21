import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/widgets/screen_list_tile_widget_model.dart';
import '../../router/route_utils.dart';
import '../../utils/responsive/responsive_layout.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/screen_list_tile_widget.dart';

class FormBuilderScreen extends StatelessWidget {
  const FormBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ScreenListTileWidgetModel> models = [
      ScreenListTileWidgetModel(
        icon: SCREENS.formBuilderTextField.toIcon,
        title: SCREENS.formBuilderTextField.toTitle,
        onTap: () => context.goNamed(SCREENS.formBuilderTextField.toName),
      )
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
