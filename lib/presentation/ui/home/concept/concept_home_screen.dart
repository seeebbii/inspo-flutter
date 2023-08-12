import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_active_coverage_item_widget.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_home_request_item_widget.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_home_review_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../widgets/inspo_home_food_item.dart';
import '../dialog/inspo_confirmation_dialog.dart';

class ConceptHomeScreen extends StatefulWidget {
  const ConceptHomeScreen({Key? key}) : super(key: key);

  @override
  State<ConceptHomeScreen> createState() => _ConceptHomeScreenState();
}

class _ConceptHomeScreenState extends State<ConceptHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ConceptHomeScreenNotifier>(
        builder: (context,model,builder){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: ListView(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                        "REQUESTS",
                        style: TextStyle(
                            fontFamily: "assets/fonts/Halvetica.ttf",
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    ),

                    Container(
                      width: 20,
                      height: 25,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                        onPressed: () {

                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  child:  Expanded(
                    child: Row(
                      children: [

                        Container(
                          width: 20,
                          height: 25,
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
                            onPressed: () {
                              if (model.currentPageIndex > 0) {
                                model.pageController.previousPage(
                                  duration: Duration(milliseconds: 500),
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
                            children: [
                              InspoConceptHomeRequestItemWidget(),
                            ],
                          ),
                        ),

                        Container(
                          width: 20,
                          height: 25,
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                            onPressed: () {
                              if (model.currentPageIndex < 2) {
                                model.pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  children: [
                    Text(
                        "REVIEWS",
                        style: TextStyle(
                            fontFamily: "assets/fonts/Halvetica.ttf",
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    ),

                    Container(
                      width: 20,
                      height: 25,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                        onPressed: () {
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Container(
                  height: 172,
                  child:  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 25,
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/ic_arrow_left.svg"),
                            onPressed: () {
                              if (model.currentPageIndex < 2) {

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
                            children: [
                              InspoConceptHomeReviewItemWidget()
                            ],
                          ),
                        ),

                        Container(
                          width: 20,
                          height: 25,
                          child: IconButton(
                            icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                            onPressed: () {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 39),
                Row(
                  children: [
                    Text(
                        "ACTIVE COVERAGES",
                        style: TextStyle(
                            fontFamily: "assets/fonts/Halvetica.ttf",
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        )
                    ),

                    Container(
                      width: 20,
                      height: 25,
                      child: IconButton(
                        icon: SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                        onPressed: () {
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9),
                InspoConceptActiveCoverageItemWidget()
              ],
            ),
          );
        }
      ),
    );
  }
}
