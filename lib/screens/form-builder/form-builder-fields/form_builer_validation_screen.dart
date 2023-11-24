import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive/responsive_layout.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/drawer_widget.dart';
import '../../../router/route_utils.dart';

class FormBuilderValidationScreen extends StatelessWidget {
  FormBuilderValidationScreen({super.key});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String _prefixFromLabel =
      'screens.formBuilder.children.validation.form';
  final List<String> _langList = [
    'Dart',
    'Kotlin',
    'Java',
    'Swift',
    'Objective-C',
    'Other'
  ];
  final List<String> _databaseList = [
    'Mongo DB',
    'MySQL',
    'Firebase',
    'Appwrite',
    'Other'
  ];
  final List<String> _colorsList = ['Red', 'Blue', 'Green', 'Other'];
  final List<String> _filterChipList = [
    'Apple',
    'Samsung',
    'Google',
    'LG',
    'Sony',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.formBuilderValidation.toTitle),
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: Padding(
        padding: const EdgeInsets.all(AppStyleDefaultProperties.p),
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(4),
                        FormBuilderValidators.required(),
                      ]),
                      decoration: InputDecoration(
                          labelText: context.tr('$_prefixFromLabel.name')),
                    ),
                    const SizedBox(height: AppStyleDefaultProperties.h),
                    FormBuilderTextField(
                      name: 'phone_number',
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                          labelText:
                              context.tr('$_prefixFromLabel.phoneNumber')),
                    ),
                    const SizedBox(height: AppStyleDefaultProperties.h),
                    FormBuilderTextField(
                      name: 'email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(),
                        FormBuilderValidators.required(),
                      ]),
                      decoration: InputDecoration(
                          labelText: context.tr('$_prefixFromLabel.email')),
                    ),
                    const SizedBox(height: AppStyleDefaultProperties.h),
                    FormBuilderTextField(
                      name: 'password',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(6),
                        FormBuilderValidators.required(),
                      ]),
                      decoration: InputDecoration(
                          labelText: context.tr('$_prefixFromLabel.password')),
                    ),
                    const SizedBox(height: AppStyleDefaultProperties.h),
                    FormBuilderTextField(
                      name: 'confirmPassword',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(6),
                        FormBuilderValidators.required(),
                        (String? val) {
                          if (val !=
                              _formKey
                                  .currentState?.fields['password']?.value) {
                            return "The password and confirm password doesn't match.";
                          }
                          return null;
                        }
                      ]),
                      decoration: InputDecoration(
                          labelText:
                              context.tr('$_prefixFromLabel.confirmPassword')),
                    ),
                    const SizedBox(height: AppStyleDefaultProperties.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  // style: theme.elevatedButtonTheme.style?.copyWith(),
                  child: Text(context.tr('$_prefixFromLabel.reset'))),
            ),
            const SizedBox(width: AppStyleDefaultProperties.w),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {}
                  },
                  child: Text(context.tr('$_prefixFromLabel.submit'))),
            )
          ],
        )
      ],
    );
  }
}
