import 'package:clean_architecture_template/presentation/notifiers/bottomNavBar.notifier.dart';
import 'package:clean_architecture_template/presentation/notifiers/conceptHomeMainScreen.notifier.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_calendar_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_request_accepted_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_view_all_coverage_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_view_all_reviews_screen.dart';
import 'package:clean_architecture_template/presentation/ui/invoice/invoice_list_screen.dart';
import 'package:clean_architecture_template/presentation/ui/setting/concept/inspo_concept_settings_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_home_screen.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_payment_bottom_sheet.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_bottom_nav.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../utils/dimensions.dart';
import '../../../widgets/app_simple_text_field.dart';
import '../../../widgets/inspo_app_bar.dart';
import '../../../widgets/inspo_button.dart';

class ConceptHomeMainScreen extends StatelessWidget {
  const ConceptHomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarProvider = Provider.of<BottomNavBarProvider>(context);
    final conceptHomeMainScreenProvider =
        Provider.of<ConceptHomeMainScreenProvider>(context);
    int currentIndex = bottomNavBarProvider.selectedIndex;

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: const InspoConceptAppBar(),
            body: _buildScreen(currentIndex),
            bottomNavigationBar: const InspoBottomNavBar(),
          ),
          conceptHomeMainScreenProvider.isPaymentDialogVisible
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                )
              : const SizedBox.shrink(),
          conceptHomeMainScreenProvider.isPaymentDialogVisible
              ? const InspoConceptPaymentBottomSheet()
              : const SizedBox.shrink()
        ],
      ),
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
    case 3:
      return const ConceptViewAllReviewsScreen();
    case 4:
      return const ConceptCalendarScreen();
    case 5:
      return const ConceptViewAllCoverageScreen();
    case 6:
      return ConceptRequestAcceptedSreen();
    default:
      return const ConceptHomeScreen();
  }
}
