import 'package:clean_architecture_template/presentation/view_models/concept/concept_edit_profile_VM.dart';
import 'package:clean_architecture_template/presentation/view_models/edit_profile_VM.dart';
import 'package:clean_architecture_template/presentation/widgets/app_simple_text_field.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/file_handler.dart';
import '../../../widgets/inspo_button.dart';

class InspoConceptEditProfileScreen extends StatefulWidget {
  const InspoConceptEditProfileScreen({Key? key}) : super(key: key);

  @override
  State<InspoConceptEditProfileScreen> createState() => _InspoConceptEditProfileScreenState();
}

class _InspoConceptEditProfileScreenState extends State<InspoConceptEditProfileScreen> {
  final EditProfileScreenVM authenticationScreenVM = EditProfileScreenVM();

  @override
  Widget build(BuildContext context) {
    EditProfileScreenVM editProfileScreenVM =
    context.read<EditProfileScreenVM>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "EDIT PROFILE",
          style: Dimensions.customTextStyle(
            16,
            FontWeight.w600,
            Colors.black,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.5, top: 15, bottom: 15),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.arrow_back_sharp, size: 20),
            ),
          ),
        ),
        actions: [
          InspoButton(
            text: "Done",
            width: 80,
            height: 28,
            buttonColor: Colors.black,
            marginRight: 12.5,
            buttonRadius: 20,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
            borderWidth: 1,
          ),
        ],
      ),
      body: Consumer<ConceptEditProfileScreenVM>(
        builder: (context, model, builder) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                FileHandler.pickImageFromGallery().then((value) {
                                  if (value == null) return;
                                  editProfileScreenVM.setProfilePhoto(value);
                                });
                              },
                              child: Center(
                                child: Container(
                                  margin:
                                  const EdgeInsets.only(top: 25, bottom: 15),
                                  padding: EdgeInsets.only(
                                    top: editProfileScreenVM.profilePhoto == null
                                        ? context.height * 0.1
                                        : 0,
                                  ),
                                  width: 155,
                                  height: 155,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 3),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/profile_image_highlighted.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: editProfileScreenVM.profilePhoto == null
                                        ? SvgPicture.asset(
                                      "assets/icons/camera.svg",
                                      color: Colors.white,
                                    )
                                        : ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(100),
                                      child: Container()/*Image.file(
                                        editProfileScreenVM.profilePhoto ??
                                            File(''),
                                        fit: BoxFit.cover,
                                        width: 155,
                                      )*/,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AppSimpleTextField(
                              title: "NAME",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              isName: true,
                              hintText: "INSPIRED EDIBLES",
                              controller: model.usernameController,
                              fieldNameText: "",
                              hasBorders: false,
                              borderWidth: 1,
                              marginBottom: 20,
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.name,
                            ),
                            AppSimpleTextField(
                                title: "EMAIL",
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                isEmail: true,
                                hintText: "GOTINSPO@EMAIL.COM",
                                controller: model.emailController,
                                fieldNameText: "",
                                hasBorders: false,
                                borderWidth: 1,
                                marginBottom: 20,
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.emailAddress),
                            AppSimpleTextField(
                                title: "PASSWORD",
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                hintText: "GOTINSPOOOO003",
                                controller: model.passwordController,
                                isPass: true,
                                fieldNameText: "",
                                hasBorders: false,
                                borderWidth: 1,
                                marginBottom: 20,
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.emailAddress),
                            AppSimpleTextField(
                              title: "DESCRIPTION",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              hintText: "i like food",
                              controller: model.descriptionController,
                              fieldNameText: "",
                              hasBorders: false,
                              borderWidth: 1,
                              marginBottom: 20,
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.name,
                            ),
                            AppSimpleTextField(
                              title: "DELIVERY PLATFORM",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              hintText: "9AM - 10PM",
                              controller: model.deliveryPlatformController,
                              fieldNameText: "",
                              hasBorders: false,
                              borderWidth: 1,
                              marginBottom: 20,
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.name,
                            ),
                            Text(
                              "SOCIALS",
                              style: Dimensions.customTextStyle(
                                16,
                                FontWeight.w700,
                                AppTheme.blackColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            AppSimpleTextField(
                                title: "INSTAGRAM",
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                hintText: "@GOTINSPO",
                                controller: model.instagramController,
                                fieldNameText: "",
                                hasBorders: false,
                                borderWidth: 1,
                                marginBottom: 20,
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.emailAddress),
                            AppSimpleTextField(
                                title: "TWITTER",
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                hintText: "@INSPOGOTWITTER",
                                controller: model.twitterController,
                                fieldNameText: "",
                                hasBorders: false,
                                borderWidth: 1,
                                marginBottom: 20,
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.emailAddress),
                            AppSimpleTextField(
                                title: "TIK-TOK",
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                hintText: "@INSPOGOTIKTOK",
                                controller: model.tiktokController,
                                fieldNameText: "",
                                hasBorders: false,
                                borderWidth: 1,
                                marginBottom: 20,
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.emailAddress),
                            AppSimpleTextField(
                                title: "TYPE OF BUSINESS",
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                hintText: "Local",
                                controller: model.typeOfBusinessController,
                                fieldNameText: "",
                                hasBorders: false,
                                borderWidth: 1,
                                marginBottom: 20,
                                onChange: (value) {
                                  print(value);
                                },
                                keyboard: TextInputType.emailAddress),
                            AppSimpleTextField(
                              title: "WEBSITE",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              hintText: "https://web.com",
                              controller: model.websiteController,
                              fieldNameText: "",
                              hasBorders: false,
                              borderWidth: 1,
                              marginBottom: 20,
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.name,
                            ),
                            AppSimpleTextField(
                              title: "CATAGORY",
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              hintText: "RESTURANT",
                              controller: model.catagoryController,
                              fieldNameText: "",
                              hasBorders: false,
                              borderWidth: 1,
                              marginBottom: 20,
                              onChange: (value) {
                                print(value);
                              },
                              keyboard: TextInputType.name,
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
