import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';
import '../re_schedule_bottom_sheet.dart';

class InspoConceptActiveCoverageItemWidget extends StatelessWidget {
  const InspoConceptActiveCoverageItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(width: 10),
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
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                    text: 'WILL COVER YOUR CONCEPT @',
                    style: Dimensions.customTextStyle(
                      15,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' 6:00 PM',
                        style: Dimensions.customTextStyle(
                          15,
                          FontWeight.w700,
                          AppTheme.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: ' ON',
                        style: Dimensions.customTextStyle(
                          15,
                          FontWeight.w400,
                          AppTheme.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: ' 29/23',
                        style: Dimensions.customTextStyle(
                          15,
                          FontWeight.w700,
                          AppTheme.blackColor,
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: InspoButton(
                      text: "RE-SCHEDULE",
                      width: 146,
                      height: 50,
                      marginTop: 5,
                      buttonColor: AppTheme.whiteColor,
                      buttonRadius: 7,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      borderWidth: 1,
                      textColor: Colors.black,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ReScheduleBottomSheet();
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: InspoButton(
                      text: "ADDRESS",
                      width: 146,
                      height: 50,
                      marginTop: 5,
                      buttonColor: AppTheme.whiteColor,
                      buttonRadius: 7,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      borderWidth: 1,
                      textColor: Colors.black,
                      onPressed: () {
                        showAccountDialog(context);
                      },
                    ),
                  )
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
}
