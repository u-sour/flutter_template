import 'package:flutter/material.dart';
import '../../../utils/responsive/responsive_layout.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../router/route_utils.dart';

class FormBuilderTextFieldScreen extends StatelessWidget {
  const FormBuilderTextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.formBuilderTextField.toTitle),
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: const Column(
        children: [Text('data')],
      ),
    );
  }
}
