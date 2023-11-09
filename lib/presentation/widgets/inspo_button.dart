import 'dart:async';

import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:clean_architecture_template/utils/dimensions.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:path/path.dart';

class InspoButton extends StatefulWidget {
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
  bool longPressAnimation;
  bool hapticFeedback;

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
    this.borderWidth = 0,
    this.longPressAnimation = false,
    this.hapticFeedback = false,
  }) : super(key: key);

  @override
  State<InspoButton> createState() => _InspoButtonState();
}

class _InspoButtonState extends State<InspoButton> {
  bool isPressed = false;
  Timer? colorChangeTimer;

  Timer? longPressTimer;

  List<Color> buttonAnimationColors = const [
    Color(0xFFA9FF74),
    Color(0xFF74FFB4),
    Color(0xFF74E6FF),
    Color(0xFF7492FF),
    Color(0xFF8774FF),
    Color(0xFFA074FF),
    Color(0xFFDB74FF),
    Color(0xFFFF74E0),
    Color(0xFFFF7474),
    Color(0xFFFF9574),
    Color(0xFFFFC774),
    Color(0xFFFFF974),
    Color(0xFFC2FF74),
  ];

  List<Color> textColors = const [
    Color(0xFF000000),
    Color(0xFF000000),
    Color(0xFF000000),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFF000000),
    Color(0xFF000000),
  ];

  int currentColorIndex = 0;

  Color invert(Color color) {
    final r = 255 - color.red;
    final g = 255 - color.green;
    final b = 255 - color.blue;

    return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }

  Color get buttonColorAnimation {
    if (widget.longPressAnimation) {
      return buttonAnimationColors[currentColorIndex];
    } else {
      return invert(widget.buttonColor!);
    }
  }

  Color get textColorAnimation {
    if (widget.longPressAnimation) {
      return textColors[currentColorIndex];
    } else {
      return invert(widget.textColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (widget.hapticFeedback) {
          Vibration.vibrate(duration: 100, amplitude: 170);
        }
        if (!widget.longPressAnimation) {
          setState(() {
            isPressed = true;
          });
        }
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onTap: widget.onPressed,
      onLongPressStart: (details) async {
        if (widget.longPressAnimation) {
          longPressTimer = Timer(const Duration(milliseconds: 5000), () {
            isPressed = true;
          });
          colorChangeTimer =
              Timer.periodic(const Duration(milliseconds: 200), (timer) {
            setState(() {
              currentColorIndex =
                  (currentColorIndex + 1) % buttonAnimationColors.length;
            });
          });
        }
      },
      onLongPressEnd: (details) {
        setState(() {
          isPressed = false;
          colorChangeTimer?.cancel();
          longPressTimer?.cancel();
          currentColorIndex = 0;
        });
      },
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.only(
            top: widget.marginTop,
            bottom: widget.marginBottom,
            left: widget.marginLeft,
            right: widget.marginRight),
        decoration: BoxDecoration(
            color: isPressed ? buttonColorAnimation : widget.buttonColor!,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(widget.buttonRadius),
            border: Border.all(width: widget.borderWidth)),
        duration: Duration(milliseconds: widget.longPressAnimation ? 200 : 0),
        child: Center(
          child: Text(
            widget.text,
            style: Dimensions.customTextStyle(
                widget.fontSize,
                widget.fontWeight!,
                isPressed ? textColorAnimation : widget.textColor),
          ),
        ),
      ),
    );
  }
}
