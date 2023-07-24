import 'package:clean_architecture_template/presentation/widgets/inspo_review_circle.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import 'inspo_button.dart';

class InspoHomeFoodItem extends StatelessWidget {
  VoidCallback? onTap;
  InspoHomeFoodItem({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 110,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Image.asset("assets/images/sample.png"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GOOD CUP",
                      style: Dimensions.customTextStyle(
                        24,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 21,
                      height: 21,
                      child: Image.asset("assets/images/instagram.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InspoButton(
                        text: "COVER IT",
                        width: 119,
                        height: 33,
                        buttonColor: Colors.black,
                        buttonRadius: 7,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.white,
                        borderWidth: 1,
                        onPressed: onTap),
                    InspoButton(
                      text: "NUDGE IT",
                      width: 119,
                      height: 33,
                      marginLeft: 8,
                      buttonColor: Colors.white,
                      buttonRadius: 7,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.black,
                      borderWidth: 1,
                      onPressed: () {},
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const InspoReviewCircle();
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 7.5),
                        child: Text(
                          "5.0 . 219 Reviews",
                          style: Dimensions.customTextStyle(
                            6,
                            FontWeight.w400,
                            Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "WITH CHEESE AND SMASHED MEAT",
                  style: Dimensions.customTextStyle(
                    12,
                    FontWeight.w400,
                    Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
