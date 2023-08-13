import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_settings_item.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_router.dart';
import '../../../../utils/dimensions.dart';

class InspoConceptSettingsScreen extends StatefulWidget {
  const InspoConceptSettingsScreen({Key? key}) : super(key: key);

  @override
  State<InspoConceptSettingsScreen> createState() => _InspoConceptSettingsScreenState();
}

class _InspoConceptSettingsScreenState extends State<InspoConceptSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(height: context.height * 0.05),
              SizedBox(
                height: 150,
                child: Image.asset("assets/images/profile_image.png"),
              ),
              const SizedBox(height: 10),
              Text(
                "GOODCUP",
                style: Dimensions.customTextStyle(
                  32,
                  FontWeight.w700,
                  Colors.black,
                ),
              ),
              Text(
                "GOODCUP@email.com".toUpperCase(),
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
                  context.push(AppRouter.conceptEditProfileScreen);                },
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
          name: "SECRET",
          switchVisible: false,
          onTap: () {
            context.push(AppRouter.pastCoverageScreen);
          },
        ),
        InspoSettingsItem(name: "NOTIFICATIONS", switchVisible: true),
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
