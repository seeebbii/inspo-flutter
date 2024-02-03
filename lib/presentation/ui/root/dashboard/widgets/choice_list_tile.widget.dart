import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/presentation/widgets/app_elevated_button.dart';
import 'package:inspo/presentation/widgets/app_text_button.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';

class ChoiceListTile extends StatelessWidget {
  const ChoiceListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.2),
      //       spreadRadius: 1,
      //       blurRadius: 2,
      //       offset: const Offset(0, 1), // changes position of shadow
      //     ),
      //   ],
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.horizontalSpaces, vertical: Dimensions.tinyVerticalSpaces),
        child: Row(
          children: [
            Container(
              height: 120, width: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppTheme.blackColor,
                  width: 2,
                ),
              ),
              // padding: const EdgeInsets.all(8),
              // child: const Placeholder(),
            ),
            const SizedBox(width: Dimensions.horizontalSpaces,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.tinyVerticalSpaces),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Title', style: context.displayLarge.copyWith(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),),
                        InkWell(
                          splashColor: AppTheme.grey,
                          splashFactory: InkSplash.splashFactory,
                          borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                          radius: 30,
                          child: SvgPicture.asset(
                            Assets.instagramIcon,
                            color: AppTheme.primaryColor,
                            height: Dimensions.iconSize,
                            width: Dimensions.iconSize,
                          ),
                          onTap: (){

                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.tinyDividerHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: AppElevatedButton(
                              text: 'COVER IT',
                              onPressed: (){},
                              textColor: AppTheme.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: Dimensions.horizontalSpaces,),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: AppTextButton(
                              outlinedButton: true,
                              text: 'NUDGE IT',
                              onPressed: (){},
                              textColor: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.tinyDividerHeight,),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sagittis augue vel nisl laoreet, nec gravida tortor", style: context.bodyMedium?.copyWith(fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
