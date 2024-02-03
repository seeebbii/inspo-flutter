import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/presentation/view_models/authentication_VM.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';
import 'package:inspo/presentation/widgets/app_elevated_button.dart';
import 'package:inspo/presentation/widgets/app_simple_text_field.dart';
import 'package:inspo/presentation/widgets/app_text_button.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authVM = context.watch<AuthenticationScreenVM>();
    return Scaffold(
      appBar: AppAppbar(
        showAction: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalSpaces),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Dimensions.bigDividerHeight,
              ),
              Text('CODE IS SENT ON YOUR EMAIL',
                  style: context.displayMedium
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.hugeDividerHeight * 2,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "CODE",
                  style: context.bodyLarge,
                ),
              ),const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.center,
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  textStyle:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    // no letters or special characters allowed, only numbers
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 55,
                    fieldWidth: 50,
                    activeFillColor: AppTheme.screenBackgroundColor,
                    activeColor: AppTheme.primaryColor,
                    inactiveColor: AppTheme.primaryColor,
                    inactiveFillColor: AppTheme.screenBackgroundColor,
                    selectedFillColor: AppTheme.screenBackgroundColor,
                    selectedColor: AppTheme.primaryColor,
                    fieldOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 5),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.borderRadius)),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) async {
                    // await _trySubmit();
                  },
                  onChanged: (value) {
                    authVM.otpController.text = value;
                  },
                  appContext: context,
                  validator: (value) {
                    if (value!.length < 4) {
                      // return 'Invalid OTP'1
                    }
                    return null;
                  },
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Didn't receive the code? ",
                  style: context.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Resend',
                        style: context.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppElevatedButton(
                text: "Submit",
                onPressed: () {
                  AppRouter.router.push(AppRouter.otpVerificationScreen);
                },
              ),
              const SizedBox(
                height: Dimensions.bottomPageSpace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
