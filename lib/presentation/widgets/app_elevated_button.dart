import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  String text;
  double height;
  double width;
  double buttonRadius;
  Color textColor;
  Color? buttonColor;
  double elevation;
  FontWeight fontWeight;
  BorderSide? borderSide;
  bool withIcon;
  String? icon;

  AppElevatedButton({
    Key? key,
    this.onPressed,
    this.text = '',
    this.height = Dimensions.buttonHeight,
    this.width = Dimensions.buttonWidth,
    this.textColor = AppTheme.whiteColor,
    this.buttonColor,
    this.borderSide,
    double? buttonRadius,
    this.withIcon = false,
    this.icon,
    this.fontWeight = FontWeight.bold,
    this.elevation = 0,
  })  : buttonRadius = Dimensions.buttonRadius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if(withIcon){
      return SizedBox(
        height: height,
        width: width,
        child: ElevatedButton.icon(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              side: borderSide,
              backgroundColor: buttonColor ?? AppTheme.primaryColor,
              elevation: elevation,
              shadowColor: AppTheme.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
              ),
            ),
            icon: SvgPicture.asset(icon!, height: Dimensions.tinyIconSize, width: Dimensions.tinyIconSize),
            label: Text(
              text,
              style: context.bodyLarge.copyWith(fontWeight: fontWeight, color: textColor),
              textAlign: TextAlign.center,
            )),
      );
    }
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            side: borderSide,
            backgroundColor: buttonColor ?? AppTheme.primaryColor,
            elevation: elevation,
            shadowColor: AppTheme.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius),
            ),
          ),
          child: Text(
            text,
            style: context.bodyLarge.copyWith(fontWeight: fontWeight, color: textColor),
            textAlign: TextAlign.center,
          )),
    );
  }
}
