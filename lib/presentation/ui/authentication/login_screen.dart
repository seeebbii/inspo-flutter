
import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/presentation/notifiers/authentication.notifier.dart';
import 'package:clean_architecture_template/presentation/notifiers/bottomNavBar.notifier.dart';
import 'package:clean_architecture_template/presentation/view_models/authentication_VM.dart';
import 'package:clean_architecture_template/presentation/widgets/app_elevated_button.dart';
import 'package:clean_architecture_template/presentation/widgets/app_simple_text_field.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_bottom_nav.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {

  final TextEditingController _emailController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationScreenVM authenticationScreenVM = AuthenticationScreenVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context,model,builder){
          return InspoBottomNavBar(

          );
        },
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InspoAppBar(),
              Container(
                margin: EdgeInsets.only(left: 21,top: 24),
                child: Text(
                  "WELCOME BACK!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 21,top: 5),
                child: Text(
                  "enter the deeeeets",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 26),
                      child: Text(
                        "ARE YOU A",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InspoButton(
                          text: "INFLUENCER",
                          width: 109,
                          height: 31,
                          marginTop: 5,
                          buttonColor: Colors.black,
                          buttonRadius: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.white,
                          onPressed: (){

                          },
                        ),
                        InspoButton(
                          text: "CONCEPT",
                          width: 109,
                          height: 31,
                          marginTop: 5,
                          marginLeft: 7,
                          buttonColor: Colors.white,
                          buttonRadius: 3,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black,
                          borderWidth: 1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Consumer<AuthenticationScreenVM>(
                  builder: (context,model,builder) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25,top: 25),
                          child: Text(
                            "email",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        AppSimpleTextField(
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            marginLeft: 23,
                            marginRight: 23,
                            borderWidth: 3,
                            marginTop: 5,
                            borderRadius: 8,
                            controller: model.emailController,
                            isEmail: true,
                            fieldNameText: "",
                            onChange: (value){
                              print(value);
                            },
                            keyboard: TextInputType.emailAddress
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25,top: 25),
                          child: Text(
                            "password",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        AppSimpleTextField(
                            height: 55,
                            width: MediaQuery.of(context).size.width,
                            marginLeft: 23,
                            marginRight: 23,
                            borderWidth: 3,
                            marginTop: 5,
                            borderRadius: 8,
                            controller: model.passwordController,
                            isPass: true,
                            fieldNameText: "",
                            onChange: (value){
                              print(value);
                            },
                            keyboard: TextInputType.text
                        ),
                      ],
                    );
                  }
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).go(AppRouter.forgotPasswordScreen);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 12,right: 21),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
              ),
              InspoButton(
                text: "Submit",
                width: MediaQuery.of(context).size.width,
                height: 56,
                marginTop: 73,
                marginLeft: 25,
                marginRight: 25,
                buttonColor: Colors.black,
                buttonRadius: 8,
                fontSize: 21,
                fontWeight: FontWeight.w800,
                textColor: Colors.white,
                borderWidth: 1,
                onPressed: (){
                  GoRouter.of(context).go(AppRouter.welcomeScreen);
                },
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 22),
                  child: Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    GoRouter.of(context).go(AppRouter.signupScreen);
                  },
                  child: Text(
                    "SIGN UP HERE.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
