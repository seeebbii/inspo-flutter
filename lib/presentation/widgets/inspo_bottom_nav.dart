import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../notifiers/bottomNavBar.notifier.dart';

class InspoBottomNavBar extends StatelessWidget {
  const InspoBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    final selectedIndex = provider.selectedIndex;

    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      surfaceTintColor: Colors.white,
      padding: EdgeInsets.zero,
      height: 55,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem('assets/icons/home_navbar.svg', 0, selectedIndex == 0,
                () {
              provider.selectIndex(0);
            }),
            _buildNavItem(
                'assets/icons/event_appbar.svg', 1, selectedIndex == 1, () {
              provider.selectIndex(1);
            }),
            _buildNavItem(
                'assets/icons/settings_navbar.svg', 2, selectedIndex == 2, () {
              provider.selectIndex(2);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      String icon, int index, bool isSelected, VoidCallback onTap) {
    var borderRadius = BorderRadius.zero;
    double padding = 45;
    if (isSelected) {
      if (index == 0) {
        borderRadius = const BorderRadius.only(
            topRight: Radius.circular(28), bottomRight: Radius.circular(28));
      }
      if (index == 1) {
        borderRadius = const BorderRadius.horizontal(
            left: Radius.circular(28), right: Radius.circular(28));
        padding = 55;
      }
      if (index == 2) {
        borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(28), bottomLeft: Radius.circular(28));
      }
    }

    final backgroundColor = isSelected ? Colors.black : Colors.white;
    final iconColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: padding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: SvgPicture.asset(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
