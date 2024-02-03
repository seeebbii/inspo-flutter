import 'package:inspo/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomModalBottomSheet{

  static void showModalBottomSheet(Widget child, {required BuildContext context, Color? backgroundColor, double elevation = 5, bool isDismissible = true, bool enableDrag = true, bool expanded = false}){
    showMaterialModalBottomSheet(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.bottomSheetBorderRadius), topRight: Radius.circular(Dimensions.bottomSheetBorderRadius))
      ),
      isDismissible: isDismissible,
      elevation: elevation,
      enableDrag: enableDrag,
      expand: expanded,
      context: context,
      builder: (context) => child,
    );
  }

}