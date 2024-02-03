import 'package:flutter/cupertino.dart';

class CustomDialog {
  static void showCupertinoDialogMethod(
      {required BuildContext context,
      bool barrierDismissible = false,
      required Widget child}) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) {
          return child;
        });
  }
}
