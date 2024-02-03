import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/presentation/animations/size_transition.animation.dart';
import 'package:inspo/presentation/widgets/app_action_buttons_widget.dart';
import 'package:inspo/presentation/widgets/app_appbar.dart';
import 'package:inspo/presentation/widgets/app_text_button.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
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
              Text('WELCOME TO THE APP', style: context.displayMedium.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Text(
                "HELOOO, AS YOU SEE YOUR ON THIS ONE OF ONE PLATFORM SPECIALLY DESIGNED WITH YOU IN MIND , ENGINEERED TO BRIDGE THE GAP BETWEEN YOU AND CONCEPTS EXPLORE AND COVER IT ALL.",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              AppTextButton(
                outlinedButton: true,
                text: "ENTER!!",
                onPressed: () {
                  AppRouter.router.go(AppRouter.signupScreen);
                },
              ),
              const SizedBox(
                height: Dimensions.hugeDividerHeight,
              ),
              Text('FOLLOW OUR SOCIALS',
                  style: context.displayMedium
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              Text(
                "YK THE VIBES FOLLOW US ON THE DAGRAM AND THE OTHER SOCIALS",
                style: context.bodyLarge,
              ),
              const SizedBox(
                height: Dimensions.bigDividerHeight,
              ),
              Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.blackColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.borderRadius),
                  ),
                child: Image.asset(Assets.imageIcon, scale: 4,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
