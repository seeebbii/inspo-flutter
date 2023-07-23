import 'package:flutter/material.dart';

import '../../../widgets/app_simple_text_field.dart';
import '../../../widgets/inspo_button.dart';

class InspoConfirmationDialog extends StatelessWidget {
  final TextEditingController _requirementsController = TextEditingController();
  InspoConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: Colors.black, width: 4.0),
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 19,left: 15),
                      width: 28,
                      height: 28,
                      child: Image.asset("assets/images/avtar.png")
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "GOOD CUP",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 7),
                                child: Image.asset("assets/images/ic_arrow_right.png")
                            ),
                          ],
                        ),
                        Text(
                          "10hr",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15,top: 10),
                child: Text(
                  "GOODCUP HAS ACCEPTED YOUR REQUEST SEE YOU @ 6:00 ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 21,top: 25),
                child: Text(
                  "REQUIREMENTS",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Container(
                child: AppSimpleTextField(
                    height: 77,
                    width: MediaQuery.of(context).size.width,
                    marginLeft: 24,
                    marginRight: 24,
                    borderWidth: 1,
                    marginTop: 6,
                    borderRadius: 11,
                    hasBorders: true,
                    controller: _requirementsController,
                    fieldNameText: "",
                    onChange: (value){
                      print(value);
                    },
                    keyboard: TextInputType.emailAddress
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 21,top: 11),
                child: Text(
                  "LOCATION",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Container(
                child: AppSimpleTextField(
                    height: 57,
                    width: MediaQuery.of(context).size.width,
                    marginLeft: 24,
                    marginRight: 24,
                    borderWidth: 1,
                    marginTop: 6,
                    borderRadius: 11,
                    hasBorders: true,
                    controller: _requirementsController,
                    fieldNameText: "",
                    onChange: (value){
                      print(value);
                    },
                    keyboard: TextInputType.emailAddress
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 21,top: 11),
                child: Text(
                  "TIMING",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Container(
                child: AppSimpleTextField(
                    height: 57,
                    width: MediaQuery.of(context).size.width,
                    marginLeft: 24,
                    marginRight: 24,
                    borderWidth: 1,
                    marginTop: 6,
                    borderRadius: 11,
                    hasBorders: true,
                    controller: _requirementsController,
                    fieldNameText: "",
                    onChange: (value){
                      print(value);
                    },
                    keyboard: TextInputType.emailAddress
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: Row(
              children: [
                Expanded(
                  child: InspoButton(
                    text: "YES:)",
                    width: 119,
                    height: 47,
                    marginTop: 2,
                    marginLeft: 16,
                    buttonColor: Colors.white,
                    buttonRadius: 7,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.black,
                    borderWidth: 1,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: InspoButton(
                    text: "DECLINE:/",
                    width: 119,
                    height: 47,
                    marginTop: 2,
                    marginLeft: 8,
                    marginRight: 18,
                    buttonColor: Colors.white,
                    buttonRadius: 7,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.black,
                    borderWidth: 1,
                    onPressed: () {},
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