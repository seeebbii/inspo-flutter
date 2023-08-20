import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';
import '../inspo_button.dart';
import '../inspo_review_circle.dart';

class InspoConceptHomeReviewItemWidget extends StatelessWidget {
  InspoConceptHomeReviewItemWidget({Key? key, required this.onSliderChange, required this.sliderValue}) : super(key: key);

  Function(double) onSliderChange = (double value) {};
  double sliderValue = 0.5;

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
                    onChanged: (value) {
                      onSliderChange(value);
                    },
                    inactiveColor: AppTheme.blackColor.withOpacity(0.2),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
