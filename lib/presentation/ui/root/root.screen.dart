import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/presentation/ui/root/widgets/bottom_navigation_icon.widget.dart';
import 'package:inspo/presentation/view_models/root_navigation_VM.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  final StatefulNavigationShell child;
  const RootScreen({super.key, required this.child});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    RootNavigationVM rootNavigationVM = context.watch<RootNavigationVM>();
    return Scaffold(
      body: widget.child,
      // body: IndexedStack(
      //   index: rootNavigationVM.currentIndex,
      //   children: rootNavigationVM.screens,
      // ),
      // body: PageView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   itemBuilder: (_, index) {
      //     return rootNavigationVM.screens[index];
      //   },
      //   itemCount: rootNavigationVM.screens.length,
      //   controller: rootNavigationVM.pageController,
      //   onPageChanged: (index) {
      //     rootNavigationVM.onPageChanged(index);
      //   },
      // ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        surfaceTintColor: AppTheme.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        height: 55,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppTheme.blackColor,
                width: 3.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavigationIconWidget(
                icon: Assets.dashboardIcon,
                index: 0,
                child: widget.child,
              ),
              BottomNavigationIconWidget(
                icon: Assets.calendarIcon,
                index: 1,
                child: widget.child,
              ),
              BottomNavigationIconWidget(
                icon: Assets.settingsIcon,
                index: 2,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
