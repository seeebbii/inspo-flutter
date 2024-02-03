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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Text('WELCOME BACK!', style: context.displayMedium.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Text(
                "enter the deeeeets",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: Dimensions.bigDividerHeight,
              ),

             Align(
               alignment: Alignment.center,
               child: Text(
                 "ARE YOU A",
                 style: context.bodyLarge,
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 AppTextButton(
                    onPressed: () {
                      authVM.changeRoleSelected(0);
                    },
                   outlinedButton: true,
                   buttonColor: authVM.roleSelected == 0 ? AppTheme.primaryColor : AppTheme.transparent,
                   text: 'INFLUENCER',
                   textColor: authVM.roleSelected == 0 ?  AppTheme.whiteColor : AppTheme.primaryColor,
                 ),
                 const SizedBox(
                   width: Dimensions.horizontalSpaces,
                 ),
                 AppTextButton(
                   onPressed: () {
                     authVM.changeRoleSelected(1);
                   },
                   outlinedButton: true,
                   buttonColor: authVM.roleSelected == 1 ? AppTheme.primaryColor : AppTheme.transparent,
                   text: 'CONCEPT',
                   textColor: authVM.roleSelected == 1 ?  AppTheme.whiteColor : AppTheme.primaryColor,
                 ),
               ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextButton(
                    text: 'Forgot Password?',
                    underlineText: true,
                    onPressed: () {
                      AppRouter.router.push(AppRouter.forgotPasswordScreen);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppElevatedButton(
                text: "Submit",
                onPressed: () {
                  AppRouter.router.go(AppRouter.rootDashboardScreen);
                },
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              Align(
                alignment: Alignment.center,
                child:
                Text("Don't have an account?", style: context.bodyLarge),
              ),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if(Navigator.canPop(context)){
                        context.pop();
                      }else{
                        AppRouter.router.push(AppRouter.signupScreen);
                      }
                    },
                    child: Text('SIGN UP HERE',
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
