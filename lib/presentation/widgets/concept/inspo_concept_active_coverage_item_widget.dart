import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';

class InspoConceptActiveCoverageItemWidget extends StatelessWidget {
  const InspoConceptActiveCoverageItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConceptHomeScreenNotifier>(
      builder: (context,model,builder){
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/avtar.png"),
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
                        ]
                    ),
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

                        },
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: InspoButton(
                        text: "CONTACT INFO",
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
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );

  }
}
