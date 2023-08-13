import 'dart:io';

import 'package:clean_architecture_template/presentation/widgets/inspo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../config/router/app_router.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/file_handler.dart';
import '../../../view_models/authentication_VM.dart';
import '../../../view_models/edit_profile_VM.dart';
import '../../../widgets/app_simple_text_field.dart';
import '../../../widgets/inspo_button.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditProfileScreenVM editProfileScreenVM =
        context.watch<EditProfileScreenVM>();
    return Scaffold(
      appBar: const InspoAppBar(),
      body:
          Consumer<AuthenticationScreenVM>(builder: (context, model, builder) {
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
                        GestureDetector(
                          onTap: () {
                            FileHandler.pickImageFromGallery().then((value) {
                              if (value == null) return;
                              editProfileScreenVM.setProfilePhoto(value);
                            });
                          },
                          child: Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3),
                            ),
                            child: Center(
                              child: editProfileScreenVM.profilePhoto == null
                                  ? SvgPicture.asset(
                                      "assets/icons/camera.svg",
                                      height: 20,
                                      width: 20,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        editProfileScreenVM.profilePhoto ??
                                            File(''),
                                        fit: BoxFit.cover,
                                        width: 155,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 9),
                          child: Text(
                            "SELFIE TIME! JK UNLESS????",
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
                      title: "full name",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      borderRadius: 8,
                      marginBottom: 5,
                      controller: model.fullNameController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "TELL US ABOUT YOUR SELF",
                      height: 106,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      controller: model.bioController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "DATE OF BIRTH",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      controller: model.dobController,
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
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      icon: SvgPicture.asset("assets/icons/tiktok.svg"),
                      borderRadius: 8,
                      marginBottom: 5,
                      controller: model.tiktokController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      icon: SvgPicture.asset("assets/icons/twitter.svg"),
                      borderRadius: 8,
                      marginBottom: 5,
                      controller: model.twitterController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "PREFERRED TIMING",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      hintText: "TO RECEIVE AND ATTEND COVERS",
                      borderRadius: 8,
                      controller: model.preferredTimingController,
                      fieldNameText: "TO RECEIVE AND ATTEND COVERS",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "CONTACT",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 5,
                      borderRadius: 8,
                      controller: model.phoneController,
                      fieldNameText: "",
                      isPhone: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  AppSimpleTextField(
                      title: "ADDRESS",
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      borderWidth: 2,
                      marginBottom: 15,
                      borderRadius: 8,
                      controller: model.addressController,
                      fieldNameText: "",
                      isName: true,
                      onChange: (value) {
                        print(value);
                      },
                      keyboard: TextInputType.text),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "UPLOAD FILE",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline),
                        ),
                        SvgPicture.asset("assets/icons/upload_file.svg"),
                      ],
                    ),
                  ),
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
