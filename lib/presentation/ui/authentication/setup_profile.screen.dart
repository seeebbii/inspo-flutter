import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/presentation/view_models/authentication_VM.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';
import 'package:inspo/presentation/widgets/app_elevated_button.dart';
import 'package:inspo/presentation/widgets/app_simple_text_field.dart';
import 'package:inspo/presentation/widgets/app_text_button.dart';
import 'package:inspo/presentation/widgets/bottoms_sheets/custom_modal_bottom_sheet.dart';
import 'package:inspo/presentation/widgets/bottoms_sheets/widgets/select_file_from_sheet.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:provider/provider.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authVM = context.watch<AuthenticationScreenVM>();
    return Scaffold(
      appBar: AppAppbar(
        showAction: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.screenHorizontalSpaces),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: Dimensions.bigDividerHeight,
              ),
              Text('SETUP PROFILE',
                  style: context.displayMedium
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Text(
                "PLEASE GIMME MORE INFO",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              Row(children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.transparent,
                    border: Border.all(color: AppTheme.primaryColor, width: 3),
                  ),
                  child: const Icon(
                    CupertinoIcons.camera,
                    color: AppTheme.primaryColor,
                    size: Dimensions.iconSize,
                  ),
                ),
                const SizedBox(
                  width: Dimensions.horizontalSpaces,
                ),
                Text("SELFIE TIME! JK UNLESS????", style: context.bodyLarge),
              ]),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "Please enter your full name...",
                controller: authVM.fullNameController,
                keyboard: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Full Name',
                onChange: (str) {},
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "",
                controller: authVM.bioController,
                keyboard: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                fieldNameText: 'Tell us about yourself',
                onChange: (str) {},
                minLine: 3,
                maxLines: 5,
                maxLength: 150,
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "DD/MM/YYYY",
                controller: TextEditingController(),
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Date of Birth',
                onChange: (str) {},
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "Instagram",
                controller: authVM.instagramController,
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                isSocial: true,
                fieldNameText: 'Socials',
                socialIcon: Assets.instagramIcon,
                onChange: (str) {},
              ),
              AppSimpleTextField(
                hintText: "TikTok",
                controller: authVM.tiktokController,
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                fieldNameText: '',
                removeSpace: true,
                socialIcon: Assets.instagramIcon,
                isSocial: true,
                onChange: (str) {},
              ),
              AppSimpleTextField(
                hintText: "X",
                controller: authVM.xController,
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                fieldNameText: '',
                removeSpace: true,
                socialIcon: Assets.instagramIcon,
                isSocial: true,
                onChange: (str) {},
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "To receive and attend covers",
                controller: TextEditingController(),
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Preferred Timing',
                onChange: (str) {},
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppSimpleTextField(
                hintText: "",
                controller: authVM.phoneController,
                keyboard: TextInputType.phone,
                isPhone: true,
                textInputAction: TextInputAction.next,
                fieldNameText: 'Contact',
                onChange: (str) {},
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              Text(
                "Address",
                style: context.bodyLarge,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: AppTextButton(
                  outlinedButton: true,
                  text: "Add Address",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: Dimensions.bigDividerHeight,
              ),
              GestureDetector(
                onTap: () {
                  CustomModalBottomSheet.showModalBottomSheet(
                      const SelectFileFromSheet(),
                      context: context,
                      backgroundColor: Colors.transparent,
                      elevation: 0);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('UPLOAD FILE',
                        style: context.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                    SvgPicture.asset(
                      Assets.uploadFileIcon,
                      height: Dimensions.iconSize,
                      width: Dimensions.iconSize,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  value: authVM.setupProfileCheckBoxValue,
                  checkColor: AppTheme.whiteColor,
                  activeColor: AppTheme.primaryColor,
                  onChanged: (val) {
                    authVM.changeSetupProfileCheckBoxValue(val!);
                  },
                  title: Text(
                    "By checking this box, you agree on providing accurate information",
                    style: context.bodyLarge,
                  )),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: AppTextButton(
                  outlinedButton: true,
                  text: "Submit",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: Dimensions.bottomPageSpace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
