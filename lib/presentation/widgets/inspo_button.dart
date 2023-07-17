import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:clean_architecture_template/utils/dimensions.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class InspoButton extends StatelessWidget {
  final VoidCallback? onPressed;
  String text;
  double height;
  double width;
  double buttonRadius;
  Color textColor;
  Color? buttonColor;
  double marginTop;
  double marginBottom;
  double marginLeft;
  double marginRight;
  double fontSize;
  FontWeight? fontWeight;
  double borderWidth;

  InspoButton({
    Key? key,
    this.onPressed,
    this.text = '',
    this.height = Dimensions.buttonHeight,
    this.width = Dimensions.buttonWidth,
    this.textColor = AppTheme.whiteColor,
    this.buttonColor = AppTheme.whiteColor,
    this.buttonRadius = 0,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w300,
    this.borderWidth = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(top: marginTop,bottom: marginBottom,left: marginLeft,right: marginRight),
        decoration: BoxDecoration(
            color: buttonColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(buttonRadius),
            border: Border.all(width: borderWidth)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor
            ),
          ),
        ),
      ),
    );
  }
}
