import 'package:clean_architecture_template/presentation/notifiers/conceptCalendarScreen.notifier.dart';
import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';

class InspoConceptCalendarRequestItemWidget extends StatelessWidget {
  VoidCallback onRequestAccept;
  VoidCallback onRequestDeny;

  InspoConceptCalendarRequestItemWidget({Key? key,required this.onRequestAccept,required this.onRequestDeny}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConceptCalendarScreenNotifier>(
        builder: (context, model, builder) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.5,),
                  Row(
                    children: [
                      Container(
                          height: 14,
                          width: 14,
                          child: Image.asset("assets/images/avtar.png")),
                      SizedBox(width: 4.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ISLAM MANSOORI",
                            style: Dimensions.customTextStyle(
                              14,
                              FontWeight.w600,
                              Colors.black,
                            ),
                          ),
                          Text(
                            "10hr",
                            style: Dimensions.customTextStyle(
                              5,
                              FontWeight.w400,
                              AppTheme.blackColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 4.5),
                  Text(
                    "WANTS TO COVER YOUR CONCEPT",
                    style: Dimensions.customTextStyle(
                      7,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                  SizedBox(height: 8.7),
                  model.isRequestAccepted
                      ? Expanded(
                          child: InspoButton(
                            text: "ACCEPT",
                            height: 22,
                            marginTop: 0,
                            buttonColor: AppTheme.lightGreen,
                            buttonRadius: 3,
                            fontSize: 5.4,
                            fontWeight: FontWeight.w700,
                            borderWidth: 1,
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        )
                      : model.isRequestDenied
                          ? Expanded(
                              child: InspoButton(
                                height: 22,
                                buttonColor: AppTheme.redButton,
                                buttonRadius: 3,
                                fontSize: 5.4,
                                fontWeight: FontWeight.w700,
                                borderWidth: 1,
                                textColor: Colors.black,
                                onPressed: () {},
                              ),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: InspoButton(
                                    text: "ACCEPT",
                                    height: 22,
                                    marginTop: 0,
                                    buttonColor: AppTheme.lightGreen,
                                    buttonRadius: 3,
                                    fontSize: 5.4,
                                    fontWeight: FontWeight.w700,
                                    borderWidth: 1,
                                    textColor: Colors.black,
                                    onPressed: onRequestAccept,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: InspoButton(
                                    text: "DENY",
                                    height: 22,
                                    buttonColor: AppTheme.redButton,
                                    buttonRadius: 3,
                                    fontSize: 5.4,
                                    fontWeight: FontWeight.w700,
                                    borderWidth: 1,
                                    textColor: Colors.black,
                                    onPressed: onRequestDeny,
                                  ),
                                )
                              ],
                            ),
                  SizedBox(
                    height: 8.5,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.6,
          )
        ],
      );
    });
  }
}
