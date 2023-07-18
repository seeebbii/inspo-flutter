import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/router/app_router.dart';
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
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context,model,builder){
          return InspoBottomNavBar(

          );
        },
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InspoAppBar(),
                  Container(
                    margin: EdgeInsets.only(left: 18,top: 24),
                    child: Text(
                      "FORGOT YOUR PASSWORD :(",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 21,top: 5),
                    child: Text(
                      "Please enter your email\nassociated with your account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(left: 25,top: 160),
                child: Text(
                  "email",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            Consumer<AuthenticationScreenVM>(
            builder: (context,model,builder) {
              return AppSimpleTextField(
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
              );
              }),
              InspoButton(
                text: "Submit",
                width: MediaQuery.of(context).size.width,
                height: 56,
                marginTop: 150,
                marginLeft: 25,
                marginRight: 25,
                buttonColor: Colors.black,
                buttonRadius: 8,
                fontSize: 21,
                fontWeight: FontWeight.w800,
                textColor: Colors.white,
                borderWidth: 1,
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
