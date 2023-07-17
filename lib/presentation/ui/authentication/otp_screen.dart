import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../config/router/app_router.dart';
import '../../widgets/inspo_app_bar.dart';
import '../../widgets/inspo_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InspoAppBar(),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 130),
                      child: Text(
                        "CODE IS SENT ON YOUR EMAIL",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Text(
                        "Code",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 9),
                      child: OTPTextField(
                        length: 5,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 48,
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: Colors.black,
                        ),
                        style: TextStyle(
                            fontSize: 17
                        ),
                        outlineBorderRadius: 9,
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldStyle: FieldStyle.box,
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              "RESEND CODE?",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "CHECK YOUR EMAIL",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InspoButton(
                      text: "Submit",
                      width: 183,
                      height: 45,
                      marginTop: 24,
                      buttonColor: Colors.black,
                      buttonRadius: 8,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      textColor: Colors.white,
                      borderWidth: 1,
                      onPressed: (){
                        GoRouter.of(context).go(AppRouter.applicationUnderReviewScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
