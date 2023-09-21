import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:clean_architecture_template/presentation/widgets/concept/inspo_concept_payment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../../notifiers/conceptHomeMainScreen.notifier.dart';
import '../inspo_button.dart';
import '../re_schedule_bottom_sheet.dart';

class InspoConceptPaymentDueWidget extends StatelessWidget {
  const InspoConceptPaymentDueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conceptHomeMainScreenProvider =
        Provider.of<ConceptHomeMainScreenProvider>(context);
    final provider = Provider.of<BottomNavBarProvider>(context);
    bool isOutstandingPayment = false;

    return Consumer<ConceptHomeScreenNotifier>(
        builder: (context, model, builder) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showAccountDialog(context);
                    },
                    child: Image.asset("assets/images/avtar.png"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ISLAM MANSOORI",
                        style: Dimensions.customTextStyle(
                          21,
                          FontWeight.w600,
                          Colors.black,
                        ),
                      ),
                      Text(
                        "10hr",
                        style: Dimensions.customTextStyle(
                          12,
                          FontWeight.w400,
                          AppTheme.blackColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'YOUR ',
                    style: Dimensions.customTextStyle(
                      20,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: 'FUNDING IS DUE',
                    style: Dimensions.customTextStyle(
                      20,
                      FontWeight.w500,
                      AppTheme.blackColor,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: InspoButton(
                      text: "BOOSTER PAYMENT",
                      width: 146,
                      height: 50,
                      marginTop: 5,
                      buttonColor: AppTheme.lightGreen,
                      buttonRadius: 3,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      borderWidth: 1,
                      textColor: Colors.black,
                      onPressed: () {
                        if(isOutstandingPayment){
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return outstandingBottomSheet(conceptHomeMainScreenProvider,context);
                            },
                          );
                        }else{
                          conceptHomeMainScreenProvider.setDialogVisible(true);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  void showAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Dialog(
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(width: 2, color: Colors.black),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/close.svg",
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset("assets/images/avtar.png"),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ISLAM MANSOORI",
                            style: Dimensions.customTextStyle(
                              21,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "CONTACT INFO",
                    style: Dimensions.customTextStyle(
                      21,
                      FontWeight.w600,
                      Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "ADDRESS",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "KUWAIT CITY , BLOCK 89 , ST 676 , HOUSE 921",
                    style: Dimensions.customTextStyle(
                      12,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "PHONE NUMBER",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "+965 88883333",
                    style: Dimensions.customTextStyle(
                      12,
                      FontWeight.w400,
                      Colors.black,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: InspoButton(
                            text: "SAVE",
                            height: 48,
                            marginTop: 5,
                            buttonColor: AppTheme.whiteColor,
                            buttonRadius: 9,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            borderWidth: 2,
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InspoButton(
                            text: "SHARE",
                            height: 48,
                            marginTop: 5,
                            buttonColor: AppTheme.whiteColor,
                            buttonRadius: 9,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            borderWidth: 2,
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 33),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget outstandingBottomSheet(ConceptHomeMainScreenProvider conceptHomeMainScreenProvider,BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          border: Border.all(width: 2)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Center(
              child: SvgPicture.asset("assets/icons/arrow_down.svg")
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OUTSTANDING PAYMENT",
                  style: Dimensions.customTextStyle(
                    35,
                    FontWeight.w700,
                    Colors.black,
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  "to continue using inspo clear your DUE payments & enjoy growing your business <3".toUpperCase(),
                  style: Dimensions.customTextStyle(
                    13,
                    FontWeight.w400,
                    Colors.black,
                  ),
                ),
                SizedBox(height: 21),
                InspoButton(
                  text: "PAY NOW",
                  height: 56,
                  buttonColor: AppTheme.whiteColor,
                  buttonRadius: 8,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  borderWidth: 1,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                    conceptHomeMainScreenProvider.setDialogVisible(true);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
