import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../utils/dimensions.dart';
import 'inspo_button.dart';

class ReScheduleBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConceptHomeScreenNotifier>(
        builder: (context, model, builder) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            border: Border.all(width: 2)),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Center(child: SvgPicture.asset("assets/icons/arrow_down.svg")),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                  Text(
                    "SELECT YOUR RESCHEDULED DATE & TIME",
                    style: Dimensions.customTextStyle(
                      16,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SET A DATE",
                      style: Dimensions.customTextStyle(
                        18,
                        FontWeight.w600,
                        Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.3),
                  GestureDetector(
                    onTap: () async {
                      await showCupertinoModalPopup<void>(
                        context: context,
                        builder: (_) {
                          final size = MediaQuery.of(context).size;
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            height: size.height * 0.4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 80),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (value) {
                                  model.setDate(value);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            model.date == null
                                ? "SEP 17, 2023"
                                : DateFormat("MMM dd, yyyy")
                                    .format(model.date!),
                            style: Dimensions.customTextStyle(
                              12.19,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SET A TIME",
                        style: Dimensions.customTextStyle(
                          18,
                          FontWeight.w600,
                          Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5.3),
                      GestureDetector(
                        onTap: () async {
                          await showCupertinoModalPopup<void>(
                            context: context,
                            builder: (_) {
                              final size = MediaQuery.of(context).size;
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                height: size.height * 0.4,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 80),
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged: (value) {
                                      model.setTime(value);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(width: 1)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                model.time == null
                                    ? "8:00 PM"
                                    : DateFormat("h:mm a").format(model.time!),
                                style: Dimensions.customTextStyle(
                                  12.19,
                                  FontWeight.w600,
                                  Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 33),
                      InspoButton(
                        text: "CONFIRM",
                        height: 47,
                        marginLeft: 90,
                        marginRight: 90,
                        buttonColor: AppTheme.whiteColor,
                        buttonRadius: 9,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        borderWidth: 2,
                        textColor: Colors.black,
                        onPressed: () {},
                        hapticFeedback: true,
                        longPressAnimation: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
