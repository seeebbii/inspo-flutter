import 'package:inspo/config/app_theme.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppShadowContainerWidget extends StatelessWidget {
  final Widget child;
  double? height;
  double? width;
  EdgeInsetsGeometry? margin;
  Color boxShadowColor;
  double borderRadius;
  Alignment? alignment;
  EdgeInsets? padding;

  AppShadowContainerWidget(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.margin,
      this.boxShadowColor = AppTheme.boxShadowColor,
      this.borderRadius = Dimensions.borderRadius, this.alignment, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      height: height,
      width: width,
      margin: margin,
      child: child,
    );
  }
}
