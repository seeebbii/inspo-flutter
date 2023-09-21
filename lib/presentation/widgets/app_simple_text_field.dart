import 'package:clean_architecture_template/config/app_theme.dart';
import 'package:clean_architecture_template/presentation/view_models/authentication_VM.dart';
import 'package:clean_architecture_template/utils/dimensions.dart';
import 'package:clean_architecture_template/utils/extensions/context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AppSimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;

  final String fieldNameText;
  final bool isEmail;
  final bool isName;
  final bool isPhone;
  final bool isPass;
  final bool isRePass;
  final bool isReadOnly;
  final bool isOptional;
  final int minLength;
  bool enabled;
  int? maxLength;
  final int maxLines;
  final TextInputAction textInputAction;
  IconData? prefixIcon;
  final TextInputType keyboard;
  final String validationMsg;
  List<TextInputFormatter>? inputFormatters;
  VoidCallback? onTap;
  Function onChange;
  double marginTop;
  double marginBottom;
  double marginLeft;
  double marginRight;
  double borderWidth;
  double borderRadius;
  double width;
  double height;
  Widget? icon;
  FontWeight titleFontWeight;
  final bool hasBorders;

  AppSimpleTextField(
      {Key? key,
      required this.controller,
      this.title = '',
      this.hintText = '',
      required this.fieldNameText,
      this.isEmail = false,
      this.isName = false,
      this.isPhone = false,
      this.isPass = false,
      this.isRePass = false,
      this.isReadOnly = false,
      this.isOptional = false,
      this.enabled = true,
      this.minLength = 1,
      this.maxLength,
      this.maxLines = 1,
      this.textInputAction = TextInputAction.next,
      this.inputFormatters,
      required this.onChange,
      this.prefixIcon,
      required this.keyboard,
      this.onTap,
      this.marginTop = 0,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.borderRadius = 0,
      this.borderWidth = 0,
      this.width = 0,
      this.height = 0,
      this.icon,
      this.hasBorders = true,
      this.titleFontWeight = FontWeight.w400,
      this.validationMsg = 'required_field_tr'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authScreenVM = context.watch<AuthenticationScreenVM>();
    // var forgotPassVM = context.watch<ForgotPassScreenVM>();
    bool isEmailValid(String value) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      return emailValid;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == ''
            ? const SizedBox.shrink()
            : Text(
                title,
                style: Dimensions.customTextStyle(
                  16,
                  titleFontWeight,
                  AppTheme.blackColor,
                ),
              ),
        Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(
            top: marginTop,
            bottom: marginBottom,
          ),
          decoration: BoxDecoration(
            border: hasBorders
                ? Border.all(width: borderWidth, color: AppTheme.blackColor)
                : Border(
                    bottom: BorderSide(
                        width: borderWidth, color: AppTheme.blackColor),
                  ),
            borderRadius:
                hasBorders ? BorderRadius.circular(borderRadius) : null,
          ),
          child: TextFormField(
              enabled: enabled,
              onTap: onTap,
              minLines: minLength,
              maxLines: maxLines,
              maxLength: maxLength,
              readOnly: isReadOnly,
              cursorColor: AppTheme.blackColor,
              validator: isOptional != true
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return validationMsg;
                      } else if (isEmail) {
                        if (!isEmailValid(value)) {
                          return ('Email is not valid!');
                        }
                      } else if (isName) {
                        if (value.length > 25) {
                          return ('Name characters should be less then 25');
                        }
                      } else if (isPass) {
                        if (value.length < 8) {
                          return ('Password should at least 8 characters!');
                        } else if (isRePass) {
                          if (authScreenVM.passwordController.text !=
                              authScreenVM.rePasswordController.text) {
                            return ('Passwords should be same!');
                          }
                        }
                      } else if (isPhone) {
                        if (value.length != 11) {
                          return ('Phone must be 11 digits!');
                        }
                      }
                      return null;
                    }
                  : (value) {
                      return null;
                    },
              textInputAction: textInputAction,
              onChanged: (str) => onChange(str),
              keyboardType: keyboard,
              controller: controller,
              inputFormatters: inputFormatters,
              obscureText: isPass
                  ? authScreenVM.isPassVisible
                  : isRePass
                      ? authScreenVM.isRePassVisible
                      : false,
              style: Dimensions.customTextStyle(
                18,
                FontWeight.w400,
                AppTheme.blackColor,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: hasBorders ? 16 : 0,
                  right: 16,
                  top: 15,
                  bottom: 15,
                ),
                fillColor: AppTheme.textFieldFillColor,
                border: InputBorder.none,
                filled: false,
                hintText: hintText,
                hintStyle: Dimensions.customTextStyle(
                  16,
                  FontWeight.w600,
                  const Color(0xFF5E6272),
                ),
                // labelText: fieldNameText,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                label: Text(fieldNameText),
                labelStyle: context.bodyMedium?.copyWith(
                  color: AppTheme.labelHintColor,
                ),
                floatingLabelStyle: context.bodyLarge
                    .copyWith(color: AppTheme.blackColor, fontSize: 15),
                // prefixIcon: prefixIcon != null
                //     ? Icon(
                //         prefixIcon,
                //         color: AppTheme.black.withOpacity(0.5),
                //         size: 18,
                //       )
                //     : const SizedBox.shrink(),
                suffixIcon: isPass
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.screenHorizontalSpaces),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  authScreenVM.setPassVisibility();
                                },
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: authScreenVM.isPassVisible
                                      ? Image.asset("assets/images/show.png")
                                      : Image.asset("assets/images/hide.png"),
                                )),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12),
                        child: icon,
                      ),
              )),
        ),
      ],
    );
  }
}
