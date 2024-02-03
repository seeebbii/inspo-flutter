import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/presentation/view_models/root_navigation_VM.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:provider/provider.dart';

class BottomNavigationIconWidget extends StatelessWidget {
  final StatefulNavigationShell child;
  final String icon;
  final int index;

  const BottomNavigationIconWidget({super.key, required this.child, required this.icon, required this.index,});

  @override
  Widget build(BuildContext context) {
    RootNavigationVM rootNavigationVM = context.watch<RootNavigationVM>();
    return Expanded(
      child: InkWell(
        onTap: (){
          child.goBranch(index, initialLocation: index == child.currentIndex);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == child.currentIndex
                ? AppTheme.primaryColor
                : AppTheme.transparent,
            borderRadius: BorderRadius.only(
              topLeft: child.currentIndex == 0 ? Radius.zero : const Radius.circular(Dimensions.bottomNavBarBorderRadius),
              bottomLeft: child.currentIndex == 0 ? Radius.zero : const Radius.circular(Dimensions.bottomNavBarBorderRadius),
              topRight: child.currentIndex == 2 ? Radius.zero : const Radius.circular(Dimensions.bottomNavBarBorderRadius),
              bottomRight: child.currentIndex == 2 ? Radius.zero : const Radius.circular(Dimensions.bottomNavBarBorderRadius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SvgPicture.asset(icon,
                color: index == child.currentIndex
                    ? AppTheme.whiteColor
                    : AppTheme.primaryColor,
              height: Dimensions.bigIconSize,
            ),
          ),
        ),
      ),
    );
  }
}
