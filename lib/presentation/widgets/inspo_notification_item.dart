import 'dart:math';

import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/material.dart';

import '../../config/app_theme.dart';
import '../../utils/dimensions.dart';

class InspoNotificationItem extends StatelessWidget {
  InspoNotificationItem(
      {Key? key,
      required this.type,
      required this.onAcceptRequirementsTap,
      required this.onRequirementsTap,
      required this.onCoveredTap})
      : super(key: key);

  String type;
  VoidCallback onAcceptRequirementsTap;
  VoidCallback onRequirementsTap;
  VoidCallback onCoveredTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: 28,
                  height: 28,
                  child: Image.asset("assets/images/avtar.png")),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "GOOD CUP",
                          style: Dimensions.customTextStyle(
                            20,
                            FontWeight.w600,
                            Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.arrow_forward_ios, size: 15),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: type == "APPROVED"
                              ? onAcceptRequirementsTap
                              : onRequirementsTap,
                          child: Text(
                            type == "APPROVED"
                                ? "Accept Requirements".toUpperCase()
                                : "Requirements".toUpperCase(),
                            style: Dimensions.customTextStyle(
                              type == "APPROVED" ? 9 : 11,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                        )
                      ],
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
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          type == "THANKYOU"
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    "THANK YOUUUUUU!!!",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ))
              : type == "UPCOMING"
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                            text: 'UPCOMING COVERAGE ON ',
                            style: Dimensions.customTextStyle(
                              16,
                              FontWeight.w500,
                              AppTheme.blackColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'JAN 29',
                                style: Dimensions.customTextStyle(
                                  16,
                                  FontWeight.w700,
                                  AppTheme.blackColor,
                                ),
                              ),
                            ]),
                      ),
                    )
                  : type == "APPROVED"
                      ? RichText(
                          text: TextSpan(
                              text: 'GOODCUP HAS ',
                              style: Dimensions.customTextStyle(
                                16,
                                FontWeight.w500,
                                AppTheme.blackColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'ACCEPTED YOUR REQUEST ',
                                  style: Dimensions.customTextStyle(
                                    16,
                                    FontWeight.w700,
                                    AppTheme.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'SEE YOU @ 6:00 ',
                                  style: Dimensions.customTextStyle(
                                    16,
                                    FontWeight.w500,
                                    AppTheme.blackColor,
                                  ),
                                ),
                              ]),
                        )
                      : type == "DENIED"
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: ' DENIED YOUR REQUEST',
                                    style: Dimensions.customTextStyle(
                                      16,
                                      FontWeight.w700,
                                      AppTheme.blackColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' TO COVER ;/ ',
                                    style: Dimensions.customTextStyle(
                                      16,
                                      FontWeight.w500,
                                      AppTheme.blackColor,
                                    ),
                                  ),
                                ]),
                              ),
                            )
                          : type == "COVERED"
                              ? Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "HAVE YOU COVERED IT",
                                    style: Dimensions.customTextStyle(
                                      16,
                                      FontWeight.w400,
                                      AppTheme.blackColor,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
          const SizedBox(height: 14),
          type == "COVERED"
              ? Row(
                  children: [
                    Expanded(
                      child: InspoButton(
                        text: "COVERED",
                        height: 63,
                        buttonColor: Colors.black,
                        buttonRadius: 9,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.white,
                        borderWidth: 2,
                        onPressed: onCoveredTap,
                        hapticFeedback: true,
                        longPressAnimation: true,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: InspoButton(
                        text: "NOPE",
                        height: 63,
                        marginRight: 12,
                        buttonColor: Colors.white,
                        buttonRadius: 9,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: Colors.black,
                        borderWidth: 2,
                        onPressed: () {},
                        hapticFeedback: true,
                        longPressAnimation: true,
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink()
          // : type == "APPROVED" ? InspoButton(
          //   text: "NOT YET",
          //   height: 63,
          //   marginRight: 12,
          //   buttonColor: Colors.white,
          //   buttonRadius: 9,
          //   fontSize: 14,
          //   fontWeight: FontWeight.w600,
          //   textColor: Colors.black,
          //   borderWidth: 2,
          //   onPressed: () {},
          // )
        ],
      ),
    );
  }
}
