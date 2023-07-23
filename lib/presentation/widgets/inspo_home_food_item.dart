import 'package:clean_architecture_template/presentation/widgets/inspo_review_circle.dart';
import 'package:flutter/material.dart';

import 'inspo_button.dart';

class InspoHomeFoodItem extends StatelessWidget {
  const InspoHomeFoodItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 12,left: 17),
      height: 110,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 112,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Image.asset("assets/images/sample.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Text(
                        "GOOD CUP",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 21,
                      height: 21,
                      child: Image.asset("assets/images/instagram.png"),
                    ),
                  )
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
                    onPressed: (){

                    },
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
                    onPressed: (){
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  InspoReviewCircle(),
                  InspoReviewCircle(),
                  InspoReviewCircle(),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 14,top: 5),
                child: Text(
                  "WITH CHEESE AND SMASHED MEAT",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
