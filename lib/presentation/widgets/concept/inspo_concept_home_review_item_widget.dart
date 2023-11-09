import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';
import '../inspo_review_circle.dart';

class InspoConceptHomeReviewItemWidget extends StatelessWidget {
  InspoConceptHomeReviewItemWidget(
      {Key? key,
      required this.onSliderChange,
      required this.sliderValue,
      required this.reviewStatus})
      : super(key: key);

  Function(double) onSliderChange = (double value) {};
  double sliderValue = 0;
  String reviewStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
              reviewStatus == "cc"
                  ? RichText(
                      text: TextSpan(
                          text: 'COVERED YOUR CONCEPT PLEASE ',
                          style: Dimensions.customTextStyle(
                            16,
                            FontWeight.w400,
                            AppTheme.blackColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'RATE THEM',
                              style: Dimensions.customTextStyle(
                                16,
                                FontWeight.w600,
                                AppTheme.blackColor,
                              ),
                            ),
                          ]),
                    )
                  : Text(
                      "COVERED YOUR ITEM PLEASE RATE THEM",
                      style: Dimensions.customTextStyle(
                        16,
                        FontWeight.w400,
                        AppTheme.blackColor,
                      ),
                    ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InspoReviewCircle(
                            width: 17,
                            height: 17,
                            borderWidth: index <= sliderValue ? 5 : 1);
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 10,
                  width: 169,
                  margin: EdgeInsets.only(top: 17),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 5,
                      ),
                      thumbColor: Colors.black,
                      activeTrackColor: AppTheme.blackColor.withOpacity(0.2),
                    ),
                    child: Slider(
                      value: sliderValue,
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (value) {
                        sliderValue = value;
                        onSliderChange(value);
                      },
                      inactiveColor: AppTheme.blackColor.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 34,
              ),
              reviewStatus == "cc"
                  ? Column(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'DID  ',
                              style: Dimensions.customTextStyle(
                                16,
                                FontWeight.w400,
                                AppTheme.blackColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'ISLAM MANSOORI',
                                  style: Dimensions.customTextStyle(
                                    16,
                                    FontWeight.w600,
                                    AppTheme.blackColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' COMPLETE COVERAGE',
                                  style: Dimensions.customTextStyle(
                                    16,
                                    FontWeight.w600,
                                    AppTheme.blackColor,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
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
                                onPressed: () {},
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
                      ],
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
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
