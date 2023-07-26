import 'dart:io';

import 'package:clean_architecture_template/presentation/view_models/edit_profile_VM.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_settings_item.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../config/router/app_router.dart';
import '../../../utils/dimensions.dart';

class InspoSettingsScreen extends StatefulWidget {
  const InspoSettingsScreen({Key? key}) : super(key: key);

  @override
  State<InspoSettingsScreen> createState() => _InspoSettingsScreenState();
}

class _InspoSettingsScreenState extends State<InspoSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    EditProfileScreenVM editProfileScreenVM =
        context.read<EditProfileScreenVM>();
    return ListView(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(height: context.height * 0.05),
              editProfileScreenVM.profilePhoto == null
                  ? SizedBox(
                      height: 155,
                      child: Image.asset("assets/images/profile_image.png"),
                    )
                  : Container(
                      width: 155,
                      height: 155,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3),
                        image: DecorationImage(
                          image: FileImage(editProfileScreenVM.profilePhoto!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              const SizedBox(height: 10),
              Text(
                "GOT INSPO",
                style: Dimensions.customTextStyle(
                  32,
                  FontWeight.w700,
                  Colors.black,
                ),
              ),
              Text(
                "Gotinspo@email.com".toUpperCase(),
                style: Dimensions.customTextStyle(
                  14,
                  FontWeight.w600,
                  Colors.black,
                ),
              ),
              InspoButton(
                width: 73,
                height: 25,
                borderWidth: 2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                textColor: Colors.black,
                buttonColor: Colors.white,
                marginTop: 12,
                text: "EDIT",
                buttonRadius: 15,
                onPressed: () {
                  context.push(AppRouter.editProfileScreen);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        InspoSettingsItem(name: "DARK MODE", switchVisible: true),
        InspoSettingsItem(
          name: "NEED HELP?",
          switchVisible: false,
          onTap: () {
            context.push(AppRouter.needHelpScreen);
          },
        ),
        InspoSettingsItem(
          name: "PAST COVERAGE",
          switchVisible: false,
          onTap: () {
            context.push(AppRouter.pastCoverageScreen);
          },
        ),
        InspoSettingsItem(name: "NOTIFICATIONS", switchVisible: true),
        InspoSettingsItem(name: "TUTORIAL", switchVisible: false),
        const SizedBox(height: 20),
        Column(
          children: [
            InspoButton(
              width: 85,
              height: 35,
              borderWidth: 2,
              fontWeight: FontWeight.w700,
              fontSize: 13,
              textColor: Colors.black,
              buttonColor: Colors.white,
              marginTop: 12,
              text: "LOG OUT",
              buttonRadius: 9,
              onPressed: () {
                context.go(AppRouter.loginScreen);
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
