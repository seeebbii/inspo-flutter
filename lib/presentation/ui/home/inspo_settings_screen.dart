import 'package:clean_architecture_template/presentation/widgets/inspo_button.dart';
import 'package:clean_architecture_template/presentation/widgets/inspo_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/app_router.dart';

class InspoSettingsScreen extends StatefulWidget {
  const InspoSettingsScreen({Key? key}) : super(key: key);

  @override
  State<InspoSettingsScreen> createState() => _InspoSettingsScreenState();
}

class _InspoSettingsScreenState extends State<InspoSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 155,
                  child: Image.asset("assets/images/profile_image.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 13),
                  child: Text(
                    "GOT INSPO",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    "Gotinspo@email.com",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
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
                  onPressed: (){
                    GoRouter.of(context).go(AppRouter.editProfileScreen);
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 37),
            child: InspoSettingsItem(name: "DARK MODE",switchVisible: true)
        ),
        InspoSettingsItem(name: "NEED HELP?",switchVisible: false,onTap: (){
          GoRouter.of(context).go(AppRouter.needHelpScreen);
        },),
        InspoSettingsItem(name: "PAST COVERAGE",switchVisible: false,onTap: (){
          GoRouter.of(context).go(AppRouter.pastCoverageScreen);
        },),
        InspoSettingsItem(name: "NOTIFICATIONS",switchVisible: true),
        InspoSettingsItem(name: "TUTORIAL",switchVisible: false)
      ],
    );
  }
}
