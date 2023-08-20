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

class ForgotPasswordNewPasswordScreen extends StatelessWidget {
  const ForgotPasswordNewPasswordScreen({Key? key}) : super(key: key);

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
                    Padding(
                      padding: const EdgeInsets.only(right: 128.0),
                      child: Text(
                        "Do not worry lets create a new password ",
                        style: Dimensions.customTextStyle(
                          16,
                          FontWeight.w400,
                          AppTheme.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                Consumer<AuthenticationScreenVM>(
                    builder: (context, model, builder) {
                      return Column(
                        children: [
                          AppSimpleTextField(
                              title: "Password",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              borderWidth: 2,
                              marginTop: 5,
                              marginBottom: 15,
                              borderRadius: 8,
                              controller: model.passwordController,
                              isPass: true,
                              fieldNameText: "",
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.text),
                          AppSimpleTextField(
                              title: "Confirm Password",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              marginLeft: 23,
                              marginRight: 23,
                              borderWidth: 2,
                              marginTop: 5,
                              marginBottom: 15,
                              borderRadius: 8,
                              controller: model.confirmPasswordController,
                              isRePass: true,
                              fieldNameText: "",
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.text),
                        ],
                      );
                    }),
                SizedBox(
                  height: context.height * 0.06,
                ),
                InspoButton(
                  text: "Proceed",
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  buttonColor: AppTheme.blackColor,
                  buttonRadius: 8,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.white,
                  borderWidth: 1,
                  onPressed: () {
                    context.push(AppRouter.loginScreen);
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
