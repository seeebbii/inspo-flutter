import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';
import '../inspo_review_circle.dart';

class InspoConceptViewAllReviewItemWidget extends StatelessWidget {
  const InspoConceptViewAllReviewItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7,),
                Row(
                  children: [
                    Image.asset("assets/images/avtar.png"),
                    SizedBox(width: 7),
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
                            8,
                            FontWeight.w400,
                            AppTheme.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Text(
                  "WANTS TO COVER YOUR CONCEPT",
                  style: Dimensions.customTextStyle(
                    10,
                    FontWeight.w400,
                    AppTheme.blackColor,
                  ),
                ),
                SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return InspoReviewCircle(
                      width: 12,
                      height: 12,
                      borderWidth: 3,
                    );
                  }),
                ),
                SizedBox(height: 9), // Added spacing
                Center(
                  child: Container(
                    height: 10,
                    width: 169,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,)
              ],
            ),
          ),
        ),
        SizedBox(height: 7,)
      ],
    );

  }
}
