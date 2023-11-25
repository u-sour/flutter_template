import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_template/services/auth_service.dart';
import 'package:flutter_template/utils/constants.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive/responsive_layout.dart';

class LoginFormWidget extends StatelessWidget {
  final double? formWidth;
  LoginFormWidget({super.key, this.formWidth});
  final _formKey = GlobalKey<FormBuilderState>();
  final String _fromTitle = 'screens.login.children.formTitle';
  final String _prefixFromLabel = 'screens.login.children.form';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(AppStyleDefaultProperties.p),
          width: formWidth,
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(_fromTitle),
                  style: theme.textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppStyleDefaultProperties.h),
                // FormBuilderTextField(
                //   name: 'email',
                //   decoration: ResponsiveLayout.isDesktop(context)
                //       ? const InputDecoration(
                //           prefixIcon: Icon(AppDefaultIcons.email),
                //           labelText: 'Email')
                //       : const InputDecoration(
                //           prefixIcon: Icon(AppDefaultIcons.email),
                //           hintText: 'Email',
                //           filled: true,
                //           border:
                //               OutlineInputBorder(borderSide: BorderSide.none)),
                //   validator: FormBuilderValidators.compose([
                //     FormBuilderValidators.email(),
                //     FormBuilderValidators.required()
                //   ]),
                // ),
                FormBuilderTextField(
                  name: 'username',
                  decoration: ResponsiveLayout.isDesktop(context)
                      ? InputDecoration(
                          prefixIcon: const Icon(AppDefaultIcons.username),
                          labelText: context.tr('$_prefixFromLabel.username'))
                      : InputDecoration(
                          prefixIcon: const Icon(AppDefaultIcons.username),
                          hintText: context.tr('$_prefixFromLabel.username'),
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                ),
                const SizedBox(height: AppStyleDefaultProperties.h),
                FormBuilderTextField(
                  name: 'password',
                  obscureText: true,
                  decoration: ResponsiveLayout.isDesktop(context)
                      ? InputDecoration(
                          prefixIcon: const Icon(AppDefaultIcons.password),
                          labelText: context.tr('$_prefixFromLabel.password'))
                      : InputDecoration(
                          prefixIcon: const Icon(AppDefaultIcons.password),
                          hintText: context.tr('$_prefixFromLabel.password'),
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: AppStyleDefaultProperties.h),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          context.read<AuthService>().login();
                        }
                      },
                      child: Text(context.tr('$_prefixFromLabel.submit')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
