import 'package:inspo/config/app_theme.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  Color dividerColor;
  double thickness;
  double? indent;
  double? endIndent;
  AppDivider({Key? key, this.dividerColor = AppTheme.dividerColor, this.thickness = 0.8, this.indent, this.endIndent }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: dividerColor,
    );
  }
}
