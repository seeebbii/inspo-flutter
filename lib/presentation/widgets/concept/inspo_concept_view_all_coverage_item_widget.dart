import 'package:clean_architecture_template/presentation/notifiers/conceptHomeScreen.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';

class InspoConceptViewAllCoverageItemWidget extends StatelessWidget {
  const InspoConceptViewAllCoverageItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConceptHomeScreenNotifier>(
        builder: (context,model,builder){
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                              width: 13,
                              height: 13,
                              child: Image.asset("assets/images/avtar.png")
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ISLAM MANSOORI",
                                style: Dimensions.customTextStyle(
                                  9.5,
                                  FontWeight.w600,
                                  Colors.black,
                                ),
                              ),
                              Text(
                                "10hr",
                                style: Dimensions.customTextStyle(
                                  5.5,
                                  FontWeight.w400,
                                  AppTheme.blackColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 4.5),
                      RichText(
                        text: TextSpan(
                            text: 'WILL COVER YOUR CONCEPT @',
                            style: Dimensions.customTextStyle(
                              7.2,
                              FontWeight.w400,
                              AppTheme.blackColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 6:00 PM',
                                style: Dimensions.customTextStyle(
                                  7.2,
                                  FontWeight.w700,
                                  AppTheme.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: ' ON',
                                style: Dimensions.customTextStyle(
                                  7.2,
                                  FontWeight.w400,
                                  AppTheme.blackColor,
                                ),
                              ),
                              TextSpan(
                                text: ' 29/23',
                                style: Dimensions.customTextStyle(
                                  7.2,
                                  FontWeight.w700,
                                  AppTheme.blackColor,
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(height: 9),
                      Row(
                        children: [
                          Expanded(
                            child: InspoButton(
                              text: "RE-SCHEDULE",
                              height: 23,
                              marginTop: 5,
                              buttonColor: AppTheme.whiteColor,
                              buttonRadius: 3,
                              fontSize: 7.2,
                              fontWeight: FontWeight.w700,
                              borderWidth: 1,
                              textColor: Colors.black,
                              onPressed: () {

                              },
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: InspoButton(
                              text: "CONTACT INFO",
                              height: 23,
                              marginTop: 5,
                              buttonColor: AppTheme.whiteColor,
                              buttonRadius: 3,
                              fontSize: 7.2,
                              fontWeight: FontWeight.w700,
                              borderWidth: 1,
                              textColor: Colors.black,
                              onPressed: () {
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 9.13,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.71,)
            ],
          );
        }
    );

  }
}
