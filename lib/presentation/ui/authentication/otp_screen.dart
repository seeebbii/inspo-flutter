import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../config/app_theme.dart';
import '../../../config/router/app_router.dart';
import '../../../utils/dimensions.dart';
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
      appBar: const InspoAppBar(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: context.height * 0.2),
                    Text(
                      "CODE IS SENT ON YOUR EMAIL",
                      style: Dimensions.customTextStyle(
                        24,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Text(
                        "CODE",
                        style: Dimensions.customTextStyle(
                          14,
                          FontWeight.w400,
                          AppTheme.blackColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Dimensions.tinyVerticalSpaces),
                      child: OTPTextField(
                        length: 5,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 48,
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: Colors.black,
                        ),
                        style: Dimensions.customTextStyle(
                          20,
                          FontWeight.w700,
                          AppTheme.blackColor,
                        ),
                        outlineBorderRadius: 9,
                        textFieldAlignment: MainAxisAlignment.center,
                        spaceBetween: 5,
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
                          Text(
                            "RESEND CODE?",
                            style: Dimensions.customTextStyle(
                              13,
                              FontWeight.w600,
                              AppTheme.blackColor,
                            ),
                          ),
                          Text(
                            "CHECK YOUR EMAIL",
                            style: Dimensions.customTextStyle(
                              13,
                              FontWeight.w600,
                              AppTheme.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InspoButton(
                      text: "Submit",
                      width: 183,
                      height: 45,
                      marginTop: 25,
                      buttonColor: AppTheme.blackColor,
                      buttonRadius: 8,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      borderWidth: 1,
                      onPressed: () {
                        context.push(AppRouter.applicationUnderReviewScreen);
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
