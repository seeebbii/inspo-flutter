import 'package:inspo/config/app_theme.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  Color textColor;
  Color? buttonColor;
  final VoidCallback? onPressed;
  String text;
  FontWeight fontWeight;
  bool outlinedButton;
  bool underlineText;
  AppTextButton({
    Key? key,
    this.onPressed,
    this.textColor = AppTheme.inspoSecondaryBlue,
    this.text = '',
    this.outlinedButton = false,
    this.buttonColor = AppTheme.transparent,
    this.fontWeight = FontWeight.bold,
    this.underlineText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (outlinedButton) {
      return OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: AppTheme.primaryColor,
            // shadowColor: AppTheme.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: context.bodyLarge
                .copyWith(color: textColor, fontWeight: fontWeight, decoration: underlineText ? TextDecoration.underline : TextDecoration.none),
          ));
    } else {
      return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: AppTheme.primaryColor,
            shadowColor: AppTheme.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: context.bodyLarge
                .copyWith(color: textColor, fontWeight: fontWeight, decoration: underlineText ? TextDecoration.underline : TextDecoration.none),
          ));
    }
  }
}
