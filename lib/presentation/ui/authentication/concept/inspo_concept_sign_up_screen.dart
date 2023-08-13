import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../config/router/app_router.dart';
import '../../../../utils/dimensions.dart';
import '../../../view_models/concept/concept_authentication_VM.dart';
import '../../../widgets/app_simple_text_field.dart';
import '../../../widgets/inspo_app_bar.dart';
import '../../../widgets/inspo_button.dart';

class InspoConceptSignUpScreen extends StatelessWidget {
  const InspoConceptSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InspoAppBar(),
      body: Consumer<ConceptAuthenticationScreenVM>(
          builder: (context, model, builder) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.horizontalSpaces),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    "SIGN UP",
                    style: Dimensions.customTextStyle(
                      24,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "FILL PLZ",
                    style: Dimensions.customTextStyle(
                      14,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  AppSimpleTextField(
                      title: "email",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginTop: 5,
                      marginBottom: 15,
                      borderRadius: 8,
                      controller: model.emailController,
                      isEmail: true,
                      fieldNameText: "",
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.emailAddress),
                  AppSimpleTextField(
                      title: "password",
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
                      title: "confirm password",
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
                  Text(
                    "SETUP PROFILE",
                    style: Dimensions.customTextStyle(
                      24,
                      FontWeight.w700,
                      Colors.black,
                    ),
                  ),
                  Text(
                    "PLEASE GIMME MORE INFO",
                    style: Dimensions.customTextStyle(
                      14,
                      FontWeight.w400,
                      AppTheme.blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.screenVerticalSpaces),
                    child: Row(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                              border: Border.all(width: 3),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/camera.svg",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 9),
                          child: Text(
                            "SEND BEST PICS",
                            style: Dimensions.customTextStyle(
                              14,
                              FontWeight.w400,
                              Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSimpleTextField(
                      title: "CONCEPT NAME",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      borderRadius: 8,
                      marginBottom: 5,
                      controller: model.conceptNameController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "DESCRIPTION",
                      height: 106,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      controller: model.descriptionController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "CATEGORY",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      controller: model.categoryController,
                      fieldNameText: "",
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "YEAR OF LAUNCH",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      hintText: "MM/DD/YYYY",
                      controller: model.yearOfLaunchController,
                      fieldNameText: "",
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "SOCIALS",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      icon: SvgPicture.asset("assets/icons/instagram.svg"),
                      controller: model.instagramController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "WEBSITE",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      hintText: "https://",
                      borderRadius: 8,
                      controller: model.websiteController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "DELIVERY PLATFORMS",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      controller: model.deliveryPlatformsController,
                      fieldNameText: "",
                      isPhone: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "CONTACT EMAIL",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 15,
                      borderRadius: 8,
                      controller: model.contactEmailController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "COUNTRY",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 15,
                      borderRadius: 8,
                      controller: model.countryController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: const Text(
                      "BUSINESS TYPE",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: InspoButton(
                          text: "LOCAL",
                          buttonColor: Colors.white,
                          buttonRadius: 9,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.black,
                          borderWidth: 1,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 9),
                      Expanded(
                        child: InspoButton(
                          text: "FRANCHISE",
                          buttonColor: Colors.white,
                          buttonRadius: 9,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.black,
                          borderWidth: 1,
                          onPressed: () {
                            GoRouter.of(context)
                                .go(AppRouter.otpVerificationScreen);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  AppSimpleTextField(
                      title: "CONTACT",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 15,
                      borderRadius: 8,
                      icon: SvgPicture.asset("assets/icons/whatsapp.svg"),
                      controller: model.contactController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  Row(
                    children: [
                      Checkbox(
                        value: model.agreeToTerms,
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          model.setAgreeToTerms(value!);
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "By checking this box, you agree on providing accurate information",
                            style: Dimensions.customTextStyle(
                              14,
                              FontWeight.w400,
                              AppTheme.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InspoButton(
                    text: "Submit",
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    marginTop: 25,
                    marginLeft: 20,
                    marginRight: 20,
                    marginBottom: 25,
                    buttonColor: Colors.white,
                    buttonRadius: 8,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black,
                    borderWidth: 1,
                    onPressed: () {
                      GoRouter.of(context).go(AppRouter.otpVerificationScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
