import 'package:clean_architecture_template/presentation/notifiers/bottomNavBar.notifier.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_notification_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_settings_screen.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/inspo_app_bar.dart';

class InspoHomeMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);
    int currentIndex = bottomNavBarProvider.selectedIndex;

    return Scaffold(
      body: Column(
        children: [
          InspoAppBar(),
          Expanded(child: _buildScreen(currentIndex)),
        ],
      ),
      bottomNavigationBar: InspoBottomNavBar(),
    );
  }
}

Widget _buildScreen(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return InspoHomeScreen();
    case 1:
      return InspoNotificationScreen();
    case 2:
      return InspoSettingsScreen();
    default:
      return InspoHomeScreen();
  }
}