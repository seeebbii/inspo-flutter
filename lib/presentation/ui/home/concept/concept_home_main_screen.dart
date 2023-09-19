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
    final conceptHomeMainScreenProvider = Provider.of<ConceptHomeMainScreenProvider>(context);
    int currentIndex = bottomNavBarProvider.selectedIndex;

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: const InspoConceptAppBar(),
            body: _buildScreen(currentIndex),
            bottomNavigationBar: const InspoBottomNavBar(),
          ),
          conceptHomeMainScreenProvider.isPaymentDialogVisible ? Container(
            color: Colors.black.withOpacity(0.5),
          ) : SizedBox.shrink(),
          conceptHomeMainScreenProvider.isPaymentDialogVisible ? Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 18.0,right: 18.0,top: MediaQuery.of(context).size.height / 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(11), topRight: Radius.circular(11)),
                  border: Border.all(width: 2)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 22,),
                    Row(
                      children: [
                        SizedBox(width: 22),
                        SvgPicture.asset("assets/icons/swap.svg"),
                        SizedBox(width: 10.0),
                        Text(
                            "ISLAM MANSORI",
                            style: TextStyle(
                                fontFamily: "assets/fonts/Halvetica.ttf",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.black
                            )),
                      ],
                    ),
                    SizedBox(height: 29),
                    Text(
                      "BOOSTER PAYMENT",
                      style: Dimensions.customTextStyle(
                        30,
                        FontWeight.w400,
                        Colors.black,
                      ),
                    ),
                    Text(
                      "KWD 20",
                      style: Dimensions.customTextStyle(
                        74,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: 50),
                    Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 1.25,
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 17),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction",
                                style: Dimensions.customTextStyle(
                                  17,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                              Text(
                                "10% - BOOSTER",
                                style: Dimensions.customTextStyle(
                                  17,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text(
                                "DATE 00, TIME",
                                style: Dimensions.customTextStyle(
                                  13,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 13,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Inspo booster Fees",
                                style: Dimensions.customTextStyle(
                                  17,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                              Text(
                                "10%",
                                style: Dimensions.customTextStyle(
                                  17,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Calculation",
                                style: Dimensions.customTextStyle(
                                  17,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                              Text(
                                "20KD / 1KD = 19KD",
                                style: Dimensions.customTextStyle(
                                  17,
                                  FontWeight.w400,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                      child: Text(
                        "PAYMENT METHOD",
                        style: Dimensions.customTextStyle(
                          8,
                          FontWeight.w600,
                          Colors.black,
                        ),
                      ),
                    ),
                    Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 1.25,
                      height: 0,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "CREDIT CARD",
                                  style: Dimensions.customTextStyle(
                                    8,
                                    FontWeight.w600,
                                    Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/icons/credit_cards.svg")
                          ],
                        ),
                    ),
                    Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 1.25,
                      height: 0,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                        child: Column(
                          children: [
                            AppSimpleTextField(
                                title: "",
                                height: 35,
                                isEmail: true,
                                width: MediaQuery.of(context).size.width,
                                borderWidth: 1,
                                borderRadius: 2,
                                hintText: "CARD NUMBERS",
                                controller: conceptHomeMainScreenProvider.emailController,
                                fieldNameText: "",
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.text
                            ),
                            SizedBox(height: 6),
                            AppSimpleTextField(
                                title: "",
                                height: 35,
                                isEmail: true,
                                width: MediaQuery.of(context).size.width,
                                borderWidth: 1,
                                borderRadius: 2,
                                hintText: "CARD NUMBERS",
                                controller: conceptHomeMainScreenProvider.emailController,
                                fieldNameText: "",
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.text
                            ),
                            SizedBox(height: 6),
                            AppSimpleTextField(
                                title: "",
                                height: 35,
                                isEmail: true,
                                width: MediaQuery.of(context).size.width,
                                borderWidth: 1,
                                borderRadius: 2,
                                hintText: "CARD NUMBERS",
                                controller: conceptHomeMainScreenProvider.emailController,
                                fieldNameText: "",
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.text
                            ),
                          ],
                        ),
                    ),
                    Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 1.25,
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "KNET",
                                style: Dimensions.customTextStyle(
                                  8,
                                  FontWeight.w600,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset("assets/icons/kNet.svg"),
                          SizedBox(),
                          SizedBox()
                        ],
                      ),
                    ),
                    Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 1.25,
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "APPLE PAY",
                                style: Dimensions.customTextStyle(
                                  8,
                                  FontWeight.w600,
                                  Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset("assets/icons/apple_pay.svg"),
                          SizedBox(),
                          SizedBox(),
                          SizedBox()
                        ],
                      ),
                    ),
                    Divider(
                      color: AppTheme.fieldOutlineColor,
                      thickness: 1.25,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27.0,vertical: 5),
                      child: InspoButton(
                        text: "Continue",
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        buttonColor: AppTheme.whiteColor,
                        buttonRadius: 8,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black,
                        borderWidth: 2,
                        onPressed: () {
                          conceptHomeMainScreenProvider.setDialogVisible(false);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ) : SizedBox.shrink()
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
