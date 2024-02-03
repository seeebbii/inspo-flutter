
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/presentation/widgets/app_elevated_button.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectFileFromSheet extends StatefulWidget {

  const SelectFileFromSheet({super.key,});

  @override
  State<SelectFileFromSheet> createState() => _SelectFileFromSheetState();
}

class _SelectFileFromSheetState extends State<SelectFileFromSheet> {
  final String googleMaps = "GOOGLE_MAPS";
  final String maps = "MAPS";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 250, // Set the minimum height here
        maxHeight: context.height * 0.4, // Set the maximum height here
      ),
      child: Container(
        margin: const EdgeInsets.all(Dimensions.spaces),
        decoration: const BoxDecoration(
          borderRadius:  BorderRadiusDirectional.only(
              topStart: Radius.circular(Dimensions.bottomSheetBorderRadius),
              topEnd: Radius.circular(Dimensions.bottomSheetBorderRadius)),
        ),
        width: context.width,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppElevatedButton(
                onPressed: (){},
                buttonColor: AppTheme.semiWhiteColor,
                withIcon: true,
                icon: Assets.cameraIcon,
                elevation: 0,
                textColor: AppTheme.primaryColor,
                fontWeight: FontWeight.normal,
                text: 'TAKE A PHOTO',
              ),
              const SizedBox(
                height: Dimensions.tinyDividerHeight,
              ),
              AppElevatedButton(
                onPressed: () {},
                withIcon: true,
                icon: Assets.photoLibraryIcon,
                buttonColor: AppTheme.semiWhiteColor,
                elevation: 0,
                textColor: AppTheme.primaryColor,
                fontWeight: FontWeight.normal,
                text: 'PHOTO LIBRARY',
              ),
              const SizedBox(
                height: Dimensions.dividerHeight,
              ),
              AppElevatedButton(
                onPressed: () => context.pop(),
                buttonColor: AppTheme.semiWhiteColor,
                elevation: 0,
                textColor: AppTheme.primaryColor,
                fontWeight: FontWeight.normal,
                text: 'CANCEL',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
