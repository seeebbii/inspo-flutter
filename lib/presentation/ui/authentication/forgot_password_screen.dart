import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../config/router/app_router.dart';
import '../../../utils/dimensions.dart';
import '../../notifiers/bottomNavBar.notifier.dart';
import '../../view_models/authentication_VM.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/inspo_bottom_nav.dart';
import '../../widgets/inspo_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InspoAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSpaces),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      "FORGOT YOUR PASSWORD :(",
                      style: Dimensions.customTextStyle(
                        24,
                        FontWeight.w700,
                        Colors.black,
                      ),
                    ),
                    Text(
                      "Please enter your email associated with your account",
                      style: Dimensions.customTextStyle(
                        14,
                        FontWeight.w400,
                        AppTheme.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.2,
                ),
                Consumer<AuthenticationScreenVM>(
                    builder: (context, model, builder) {
                  return AppSimpleTextField(
                      title: "email",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 3,
                      marginTop: 5,
                      borderRadius: 8,
                      controller: model.emailController,
                      isEmail: true,
                      fieldNameText: "",
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.emailAddress);
                }),
                SizedBox(
                  height: context.height * 0.2,
                ),
                InspoButton(
                  text: "Submit",
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  buttonColor: AppTheme.blackColor,
                  buttonRadius: 8,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  textColor: Colors.white,
                  borderWidth: 1,
                  onPressed: () {
                    context.go(AppRouter.otpVerificationScreen);
                  },
                ),
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    "Remember your password?",
                    style: Dimensions.customTextStyle(
                        16, FontWeight.w400, Colors.black),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.go(AppRouter.loginScreen);
                    },
                    child: Text(
                      "LOG IN HERE.",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
