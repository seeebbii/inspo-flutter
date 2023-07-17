import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../config/router/app_router.dart';
import '../../view_models/authentication_VM.dart';
import '../../widgets/app_simple_text_field.dart';
import '../../widgets/inspo_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthenticationScreenVM>(
        builder: (context,model,builder) {
          return  ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InspoAppBar(),
                  Container(
                    margin: EdgeInsets.only(left: 18,top: 24),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 21,top: 5),
                    child: Text(
                      "FILL PLZ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
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
                margin: EdgeInsets.only(left: 25,top: 15),
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

              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "confirm password",
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
                  controller: model.confirmPasswordController,
                  isRePass: true,
                  fieldNameText: "",
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 18,top: 24),
                child: Text(
                  "SETUP PROFILE",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 21,top: 5),
                child: Text(
                  "PLEASE GIMME MORE INFO",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 21,top: 22),
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 9),
                    child: Text(
                      "SELFIE TIME! JK UNLESS????",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "FULL NAME",
                  style: TextStyle(
                      fontSize: 16,
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
                  controller: model.fullNameController,
                  fieldNameText: "",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "TELL US ABOUT YOUR SELF",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              AppSimpleTextField(
                  height: 106,
                  width: MediaQuery.of(context).size.width,
                  marginLeft: 23,
                  marginRight: 23,
                  borderWidth: 3,
                  marginTop: 5,
                  borderRadius: 8,
                  controller: model.bioController,
                  fieldNameText: "",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "DATE OF BIRTH",
                  style: TextStyle(
                      fontSize: 16,
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
                  controller: model.dobController,
                  fieldNameText: "",
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "SOCIALS",
                  style: TextStyle(
                      fontSize: 16,
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
                  icon: Image.asset("assets/images/instagram.png"),
                  controller: model.instagramController,
                  fieldNameText: "",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              AppSimpleTextField(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  marginLeft: 23,
                  marginRight: 23,
                  borderWidth: 3,
                  icon: Image.asset("assets/images/tiktok.png"),
                  marginTop: 5,
                  borderRadius: 8,
                  controller: model.tiktokController,
                  fieldNameText: "",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              AppSimpleTextField(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  marginLeft: 23,
                  marginRight: 23,
                  borderWidth: 3,
                  icon: Image.asset("assets/images/twitter.png"),
                  marginTop: 5,
                  borderRadius: 8,
                  controller: model.twitterController,
                  fieldNameText: "",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "PREFERRED TIMING ",
                  style: TextStyle(
                      fontSize: 16,
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
                  hintText: "TO RECEIVE AND ATTEND COVERS",
                  borderRadius: 8,
                  controller: model.preferredTimingController,
                  fieldNameText: "TO RECEIVE AND ATTEND COVERS",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "CONTACT ",
                  style: TextStyle(
                      fontSize: 16,
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
                  controller: model.phoneController,
                  fieldNameText: "",
                  isPhone: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 25,top: 15),
                child: Text(
                  "ADDRESS ",
                  style: TextStyle(
                      fontSize: 16,
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
                  controller: model.addressController,
                  fieldNameText: "",
                  isName: true,
                  onChange: (value){
                    print(value);
                  },
                  keyboard: TextInputType.text
              ),
              Container(
                margin: EdgeInsets.only(left: 33,top: 23,right: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "UPLOAD FILE",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline
                      ),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      child: Image.asset("assets/images/ic_upload_file.png"),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 33,top: 24),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Checkbox(
                        value: true,
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        onChanged: (value){},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 9,top: 24),
                      child: Text(
                        "By checking this box, you agree on providing\naccurate information",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InspoButton(
                text: "Submit",
                width: MediaQuery.of(context).size.width,
                height: 56,
                marginTop: 32,
                marginLeft: 25,
                marginRight: 25,
                marginBottom: 50,
                buttonColor: Colors.white,
                buttonRadius: 8,
                fontSize: 21,
                fontWeight: FontWeight.w800,
                textColor: Colors.black,
                borderWidth: 1,
                onPressed: (){
                  GoRouter.of(context).go(AppRouter.otpVerificationScreen);
                },
              ),
            ],
          );
        }
      ),
    );
  }
}
