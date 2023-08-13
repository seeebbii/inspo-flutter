import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_active_coverage_item_widget.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_home_request_item_widget.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_home_review_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../notifiers/bottomNavBar.notifier.dart';
import '../../../widgets/inspo_home_food_item.dart';

class ConceptHomeScreen extends StatefulWidget {
  const ConceptHomeScreen({Key? key}) : super(key: key);

  @override
  State<ConceptHomeScreen> createState() => _ConceptHomeScreenState();
}

class _ConceptHomeScreenState extends State<ConceptHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    final selectedIndex = provider.selectedIndex;

    return Scaffold(
      body: Consumer<ConceptHomeScreenNotifier>(
          builder: (context, model, builder) {
        return ListView(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 19),
                GestureDetector(
                  onTap: () {
                    provider.selectIndex(4);
                  },
                  child: const Text("REQUESTS",
                      style: TextStyle(
                          fontFamily: "assets/fonts/Halvetica.ttf",
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
                SizedBox(
                  width: 20,
                  height: 25,
                  child: IconButton(
                    icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 210,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 25,
                    child: IconButton(
                      icon: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
                      onPressed: () {
                        if (model.currentPageIndex > 0) {
                          model.pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: model.pageController,
                      onPageChanged: (index) {
                        model.setCurrentPageIndex(index);
                      },
                      children: const [
                        InspoConceptHomeRequestItemWidget(),
                        InspoConceptHomeRequestItemWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 25,
                    child: IconButton(
                      icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                      onPressed: () {
                        if (model.currentPageIndex < 2) {
                          model.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const SizedBox(width: 19),
                GestureDetector(
                  onTap: () {
                    provider.selectIndex(3);
                  },
                  child: const Text("REVIEWS",
                      style: TextStyle(
                          fontFamily: "assets/fonts/Halvetica.ttf",
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
                SizedBox(
                  width: 20,
                  height: 25,
                  child: IconButton(
                    icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 172,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 25,
                    child: IconButton(
                      icon: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
                      onPressed: () {
                        if (model.currentPageIndex < 2) {}
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: model.pageController,
                      onPageChanged: (index) {
                        model.setCurrentPageIndex(index);
                      },
                      children: const [
                        InspoConceptHomeReviewItemWidget(),
                        InspoConceptHomeReviewItemWidget(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    height: 25,
                    child: IconButton(
                      icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 39),
            Row(
              children: [
                const SizedBox(width: 19),
                GestureDetector(
                  onTap: () {
                    provider.selectIndex(5);
                  },
                  child: const Text("ACTIVE COVERAGES",
                      style: TextStyle(
                          fontFamily: "assets/fonts/Halvetica.ttf",
                          fontWeight: FontWeight.w700,
                          fontSize: 16)),
                ),
                SizedBox(
                  width: 20,
                  height: 25,
                  child: IconButton(
                    icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.0),
              child: InspoConceptActiveCoverageItemWidget(),
            ),
            const SizedBox(height: 30),
          ],
        );
      }),
    );
  }
}
