import 'package:clean_architecture_template/presentation/notifiers/bottomNavBar.notifier.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_calendar_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/inspo_concept_settings_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_notification_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_settings_screen.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_bottom_nav.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/inspo_app_bar.dart';

class ConceptHomeMainScreen extends StatelessWidget {
  const ConceptHomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);
    int currentIndex = bottomNavBarProvider.selectedIndex;

    return Scaffold(
      appBar: const InspoConceptAppBar(),
      body: _buildScreen(currentIndex),
      bottomNavigationBar: const InspoBottomNavBar(),
    );
  }
}

Widget _buildScreen(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return const ConceptHomeScreen();
    case 1:
      return const ConceptCalendarScreen();
    case 2:
      return const InspoConceptSettingsScreen();
    default:
      return const ConceptHomeScreen();
  }
}
