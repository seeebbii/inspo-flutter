import 'package:clean_architecture_template/presentation/notifiers/bottomNavBar.notifier.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/event/inspo_notification_screen.dart';
import 'package:clean_architecture_template/presentation/ui/setting/inspo_settings_screen.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/inspo_app_bar.dart';

class InspoHomeMainScreen extends StatelessWidget {
  const InspoHomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);
    int currentIndex = bottomNavBarProvider.selectedIndex;

    return Scaffold(
      appBar: const InspoAppBar(),
      body: _buildScreen(currentIndex),
      bottomNavigationBar: const InspoBottomNavBar(),
    );
  }
}

Widget _buildScreen(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return const InspoHomeScreen();
    case 1:
      return const InspoNotificationScreen();
    case 2:
      return const InspoSettingsScreen();
    default:
      return const InspoHomeScreen();
  }
}
