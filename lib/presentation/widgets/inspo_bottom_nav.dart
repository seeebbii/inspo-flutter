import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifiers/bottomNavBar.notifier.dart';

class InspoBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    final selectedIndex = provider.selectedIndex;

    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.ac_unit, selectedIndex == 0, () {
            provider.selectIndex(0);
          }),
          _buildNavItem(Icons.home, selectedIndex == 1, () {
            provider.selectIndex(1);
          }),
          _buildNavItem(Icons.settings, selectedIndex == 2, () {
            provider.selectIndex(2);
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    final borderRadius = isSelected
        ? BorderRadius.horizontal(
        left: Radius.circular(27.0), right: Radius.circular(27.0))
        : BorderRadius.zero;

    final backgroundColor = isSelected ? Colors.black : Colors.white;
    final iconColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30.0,
        ),
      ),
    );
  }
}

