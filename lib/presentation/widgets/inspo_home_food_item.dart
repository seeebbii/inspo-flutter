import 'package:clean_architecture_template/presentation/widgets/inspo_review_circle.dart';
import 'package:flutter/material.dart';

import 'inspo_button.dart';

class InspoHomeFoodItem extends StatelessWidget {
  VoidCallback? onTap;
  InspoHomeFoodItem({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 12, left: 17),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 112,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Image.asset("assets/images/sample.png"),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Text(
                        "GOOD CUP",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
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
                      marginTop: 2,
                      marginLeft: 8,
                      buttonColor: Colors.black,
                      buttonRadius: 7,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.white,
                      borderWidth: 1,
                      onPressed: onTap
                    ),
                    InspoButton(
                      text: "NUDGE IT",
                      width: 119,
                      height: 33,
                      marginTop: 2,
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
                      Container(
                        margin: EdgeInsets.only(left: 9),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:5,
                          itemBuilder: (context, index) {
                            return InspoReviewCircle();
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7.5),
                        child: Text(
                          "5.0 . 219 Reviews",
                          style: TextStyle(fontSize: 6, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Text(
                    "WITH CHEESE AND SMASHED MEAT",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
