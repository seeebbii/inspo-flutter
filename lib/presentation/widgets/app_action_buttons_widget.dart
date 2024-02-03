import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:badges/badges.dart' as badge;
import 'package:inspo/utils/extensions/context.extension.dart';

class AppActionButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final bool showBadge;
  final int badgeCount;

  const AppActionButtonWidget({super.key, this.onPressed, required this.icon, required this.showBadge, this.badgeCount = 1});

  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      showBadge: showBadge,
      badgeContent: Text(
          '1',
          style: context.bodySmall?.copyWith(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.bold,
          )
      ),
      badgeStyle: badge.BadgeStyle(
        padding: const EdgeInsets.all(5),
        borderSide: const BorderSide(
          color: AppTheme.primaryColor,
          width: 2,
        ),
        shape: badge.BadgeShape.circle,
        elevation: 0,
        badgeColor: AppTheme.redColor,
      ),
      position: badge.BadgePosition.bottomEnd(bottom: 15, end: 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.tinyHorizontalSpaces),
        child: InkWell(
          splashColor: AppTheme.grey,
          splashFactory: InkSplash.splashFactory,
          borderRadius: BorderRadius.circular(Dimensions.borderRadius),
          radius: 50,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.iconSpaces),
            child: SvgPicture.asset(
              icon,
              color: AppTheme.blackColor,
              height: Dimensions.iconSize,
              width: Dimensions.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
