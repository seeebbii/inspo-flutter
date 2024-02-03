import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authVM = context.watch<AuthenticationScreenVM>();
    return Scaffold(
      appBar: AppAppbar(
        showAction: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.screenHorizontalSpaces),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Dimensions.bigDividerHeight,
              ),
              Text('FORGOT YOUR PASSWORD :(', style: context.displayMedium.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Text(
                "Please enter your email associated with your account",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: Dimensions.hugeDividerHeight,
              ),


              AppSimpleTextField(
                hintText: "Please enter your email...",
                controller: authVM.emailController,
                keyboard: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Email',
                onChange: (str) {},
                isEmail: true,
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
                height: Dimensions.dividerHeight,
              ),
              Align(
                alignment: Alignment.center,
                child:
                Text("Remember your password?", style: context.bodyLarge),
              ),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Text('LOG IN HERE.',
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,)),
                  )),
              const SizedBox(height: Dimensions.bottomPageSpace,),
            ],
          ),
        ),
      ),
    );
  }
}
