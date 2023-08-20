import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';
import '../inspo_review_circle.dart';

class InspoConceptHomeReviewItemWidget extends StatelessWidget {
  const InspoConceptHomeReviewItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), border: Border.all(width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
              Text(
                "WANTS TO COVER YOUR CONCEPT",
                style: Dimensions.customTextStyle(
                  16,
                  FontWeight.w400,
                  AppTheme.blackColor,
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Row(
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
                              width: 17, height: 17, borderWidth: 5);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
                width: 169,
                margin: EdgeInsets.only(top: 17),
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
            ],
          ),
        ),
      ),
    );
  }
}
