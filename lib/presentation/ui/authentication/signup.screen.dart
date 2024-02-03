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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              Text('SIGN UP',
                  style: context.displayMedium
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Text(
                "FILL PLZ",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
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
              AppSimpleTextField(
                hintText: "Please enter your password...",
                controller: authVM.passwordController,
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Password',
                onChange: (str) {},
                isPass: true,
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "Please re-enter your password...",
                controller: authVM.rePasswordController,
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Confirm Password',
                onChange: (str) {},
                isRePass: true,
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppElevatedButton(
                text: "SIGN UP",
                onPressed: () {
                  AppRouter.router.push(AppRouter.setupProfileScreen);
                },
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              Align(
                alignment: Alignment.center,
                child:
                    Text('Already have an account?', style: context.bodyLarge),
              ),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if(Navigator.canPop(context)) {
                        context.pop();
                      }else{
                        AppRouter.router.push(AppRouter.loginScreen);
                      }
                    },
                    child: Text('LOGIN HERE',
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
