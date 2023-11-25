import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/utils/responsive/responsive_layout.dart';
import 'package:flutter_template/widgets/login/login_brand_widget.dart';
import 'package:flutter_template/widgets/login/login_form_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);
  final animateDuration = const Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final Scaffold mobileAndTabletScaffold = Scaffold(
        body: FadeIn(
      duration: animateDuration,
      child: LoginBrandWidget(
        child: SlideInLeft(
          duration: animateDuration,
          child: LoginFormWidget(),
        ),
      ),
    ));
    final Scaffold desktopScaffold = Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SlideInLeft(
                duration: animateDuration,
                child: LoginFormWidget(formWidth: 1024.0)),
          ),
          Expanded(
            child: SlideInRight(
              duration: animateDuration,
              child: const LoginBrandWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          )
        ],
      ),
    );
    return Scaffold(
        // appBar: AppBarWidget(title: SCREENS.login.toTitle),
        body: ResponsiveLayout(
      mobileScaffold: mobileAndTabletScaffold,
      tabletScaffold: mobileAndTabletScaffold,
      desktopScaffold: desktopScaffold,
    ));
  }
}
