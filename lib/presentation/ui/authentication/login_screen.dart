import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/presentation/view_models/authentication_VM.dart';
import 'package:clean_architecture_template/presentation/widgets/app_simple_text_field.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authenticationScreenVM =
        Provider.of<AuthenticationScreenVM>(context, listen: true);
    return Scaffold(
      appBar: const InspoAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSpaces),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Text(
                  "WELCOME BACK!",
                  style: Dimensions.customTextStyle(
                    24,
                    FontWeight.w700,
                    Colors.black,
                  ),
                ),
                Text(
                  "enter the deeeeets",
                  style: Dimensions.customTextStyle(
                    14,
                    FontWeight.w400,
                    AppTheme.blackColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "ARE YOU A",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InspoButton(
                            text: "INFLUENCER",
                            width: 109,
                            height: 31,
                            marginTop: 5,
                            buttonColor: authenticationScreenVM.userType == 0
                                ? Colors.black
                                : Colors.white,
                            buttonRadius: 3,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            borderWidth: 1,
                            textColor: authenticationScreenVM.userType == 0
                                ? Colors.white
                                : Colors.black,
                            onPressed: () {
                              authenticationScreenVM.setUserType(0);
                            },
                          ),
                          InspoButton(
                            text: "CONCEPT",
                            width: 109,
                            height: 31,
                            marginTop: 5,
                            marginLeft: 7,
                            buttonColor: authenticationScreenVM.userType == 1
                                ? Colors.black
                                : Colors.white,
                            buttonRadius: 3,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: authenticationScreenVM.userType == 1
                                ? Colors.white
                                : Colors.black,
                            borderWidth: 1,
                            onPressed: () {
                              authenticationScreenVM.setUserType(1);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Consumer<AuthenticationScreenVM>(
                    builder: (context, model, builder) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSimpleTextField(
                        title: "email",
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        borderWidth: 2,
                        borderRadius: 8,
                        marginBottom: 10,
                        marginTop: 5,
                        controller: model.emailController,
                        isEmail: true,
                        fieldNameText: "",
                        onChange: (value) {
                          print(value);
                        },
                        keyboard: TextInputType.emailAddress,
                      ),
                      AppSimpleTextField(
                          title: "password",
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 2,
                          marginTop: 5,
                          marginBottom: 20,
                          borderRadius: 8,
                          controller: model.passwordController,
                          isPass: true,
                          fieldNameText: "",
                          onChange: (value) {
                            print(value);
                          },
                          keyboard: TextInputType.text),
                    ],
                  );
                }),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRouter.forgotPasswordScreen);
                    },
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                InspoButton(
                  text: "Submit",
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  marginTop: 73,
                  buttonColor: AppTheme.blackColor,
                  buttonRadius: 8,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.white,
                  borderWidth: 1,
                  onPressed: () {
                    context.push(AppRouter.welcomeScreen);
                  },
                ),
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    "Don’t have an account?",
                    style: Dimensions.customTextStyle(
                        16, FontWeight.w400, Colors.black),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRouter.signupScreen);
                    },
                    child: Text(
                      "SIGN UP HERE.",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
