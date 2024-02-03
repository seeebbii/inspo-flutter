import 'package:google_fonts/google_fonts.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/presentation/widgets/app_action_buttons_widget.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  bool isTitleText;
  Widget titleWidget;
  bool leading;
  bool centerTitle;
  Color bgColor;
  List<Widget> actions;
  Widget flexibleSpace;
  final double toolbarHeight;
  double elevation;
  Brightness statusBarBrightness;
  bool showAction;
  bool customAction;
  bool showCalendarIcon;
  bool showSearchIcon;
  bool showProfileIcon;

  AppAppbar(
      {Key? key,
      this.title,
      this.bgColor = AppTheme.transparent,
      this.leading = true,
      this.centerTitle = false,
      this.actions = const <Widget>[],
      this.isTitleText = true,
      this.titleWidget = const SizedBox.shrink(),
      this.toolbarHeight = 45,
      this.flexibleSpace = const SizedBox.shrink(),
      this.showAction = true,
        this.customAction = false,
      this.elevation = 0.0,
      this.showCalendarIcon = true,
      this.showSearchIcon = true,
      this.showProfileIcon = true,
      this.statusBarBrightness = Brightness.light})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: Theme.of(context)
          .appBarTheme
          .systemOverlayStyle
          ?.copyWith(statusBarBrightness: statusBarBrightness),
      scrolledUnderElevation: 0,
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: centerTitle,
      title: title != null && title != ''
          ? Text(
              "$title",
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              "INSPO",
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
      actions: showAction
          ? customAction ? actions : [
              showCalendarIcon
                  ? AppActionButtonWidget(
                      icon: Assets.calendarIcon,
                      onPressed: () {}, showBadge: true, badgeCount: 1,
                    )
                  : const SizedBox.shrink(),
              showSearchIcon
                  ? AppActionButtonWidget(
                      icon: Assets.searchIcon,
                      onPressed: () {}, showBadge: false,
                    )
                  : const SizedBox.shrink(),
              showProfileIcon
                  ? AppActionButtonWidget(
                      icon: Assets.profileIcon,
                      onPressed: () {}, showBadge: false,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                width: Dimensions.tinyHorizontalSpaces,
              )
            ]
          : null,
      flexibleSpace: flexibleSpace,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          color: AppTheme.blackColor,
          height: Dimensions.appBarBorderWidth,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
