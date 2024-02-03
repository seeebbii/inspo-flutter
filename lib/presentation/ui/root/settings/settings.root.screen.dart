import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/presentation/view_models/authentication_VM.dart';
import 'package:inspo/presentation/view_models/root_navigation_VM.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';
import 'package:inspo/presentation/widgets/app_elevated_button.dart';
import 'package:inspo/presentation/widgets/app_simple_text_field.dart';
import 'package:inspo/presentation/widgets/app_text_button.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:provider/provider.dart';

import 'widgets/list_tile_menu.widget.dart';

class SettingsRootScreen extends StatefulWidget {
  const SettingsRootScreen({super.key});

  @override
  State<SettingsRootScreen> createState() => _SettingsRootScreenState();
}

class _SettingsRootScreenState extends State<SettingsRootScreen> {
  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authVM = context.watch<AuthenticationScreenVM>();
    return Scaffold(
        appBar: AppAppbar(
          showAction: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.screenHorizontalSpaces),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: Dimensions.bigDividerHeight,
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.transparent,
                    border: Border.all(color: AppTheme.primaryColor, width: 3),
                  ),
                  child: const Icon(
                    CupertinoIcons.camera,
                    color: AppTheme.primaryColor,
                    size: Dimensions.iconSize,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.dividerHeight,
                ),
                Text('GOT INSPO',
                    style: context.displayMedium
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                Text(
                  "GOTINSPO@EMAIL.COM",
                  style: context.bodyLarge,
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                SizedBox(
                  height: 28,
                  child: AppTextButton(
                    outlinedButton: true,
                    onPressed: () {},
                    text: 'EDIT',
                    textColor: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.dividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'DARKMODE',
                  isSwitch: true,
                  isSwitchValue: authVM.darkModeSwitchValue,
                  onTap: () {
                    authVM
                        .changeDarkModeSwitchValue(!authVM.darkModeSwitchValue);
                  },
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'NEED HELP?',
                  onTap: () {},
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'PAST COVERAGE',
                  onTap: () {},
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'PAYMENT',
                  onTap: () {
                    AppRouter.router.pushNamed(AppRouter.paymentPage);
                  },
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'INVOICES',
                  onTap: () {},
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'NOTIFICATIONS',
                  onTap: () {
                    authVM.changeNotificationSwitchValue(
                        !authVM.notificationSwitchValue);
                  },
                  isSwitch: true,
                  isSwitchValue: authVM.notificationSwitchValue,
                ),
                const SizedBox(
                  height: Dimensions.tinyDividerHeight,
                ),
                ListTileMenuWidget(
                  title: 'TUTORIAL',
                  onTap: () {},
                ),
                const SizedBox(
                  height: Dimensions.dividerHeight,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: AppTextButton(
                    outlinedButton: true,
                    text: "LOG OUT",
                    onPressed: () {
                      Future.delayed(
                          const Duration(
                            milliseconds: 300,
                          ), () {
                        context.read<RootNavigationVM>().changeIndex(0);
                      });
                      AppRouter.router.go(AppRouter.loginScreen);
                    },
                  ),
                ),
                const SizedBox(
                  height: Dimensions.hugeDividerHeight,
                ),
              ],
            ),
          ),
        ));
  }
}
