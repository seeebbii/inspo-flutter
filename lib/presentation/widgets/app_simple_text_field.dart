import 'package:inspo/config/app_theme.dart';
import 'package:inspo/presentation/animations/size_transition.animation.dart';
import 'package:inspo/presentation/view_models/authentication_VM.dart';
import 'package:inspo/presentation/widgets/bottoms_sheets/custom_modal_bottom_sheet.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppSimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final String fieldNameText;
  final bool isEmail;
  final bool isName;
  final bool isPhone;
  final bool isPass;
  final bool isRePass;
  final bool isOldPass;
  final bool isReadOnly;
  final bool isOptional;
  final int minLine;
  bool enabled;
  int? maxLength;
  final int maxLines;
  final TextInputAction? textInputAction;
  IconData? prefixIcon;
  final TextInputType keyboard;
  final String validationMsg;
  List<TextInputFormatter>? inputFormatters;
  VoidCallback? onTap;
  Function onChange;
  bool checkMarkValue;
  bool isObSecure;
  FocusNode? focusNode;
  String? errorField;
  bool isSocial;
  String? socialIcon;
  bool removeSpace;

  AppSimpleTextField(
      {Key? key,
      required this.controller,
      this.hintText = '',
      required this.fieldNameText,
      this.isEmail = false,
      this.isName = false,
      this.isPhone = false,
      this.isOldPass = false,
      this.isPass = false,
      this.isRePass = false,
      this.isReadOnly = false,
      this.isOptional = false,
      this.enabled = true,
      this.errorField,
      bool isObSecure = false,
      this.minLine = 1,
      this.maxLength,
      this.maxLines = 1,
      this.textInputAction = TextInputAction.next,
      this.inputFormatters,
      required this.onChange,
      this.prefixIcon,
      required this.keyboard,
      this.onTap,
      this.validationMsg = 'required_field_tr',
      this.checkMarkValue = false,
      this.focusNode,
      this.isSocial = false,
      this.removeSpace = false,
      this.socialIcon})
      : isObSecure = isPass || isRePass ? true : isObSecure,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationScreenVM authenticationScreenVM =
        context.watch<AuthenticationScreenVM>();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSocial && removeSpace
              ? const SizedBox.shrink()
              : Text(
                  fieldNameText,
                  style: context.bodyLarge,
                ),
          isSocial
              ? const SizedBox(
                  height: 8,
                )
              : const SizedBox(height: Dimensions.tinyDividerHeight),
          SizedBox(
            // height: 55,
            child: TextField(
              key: key,
              focusNode: focusNode,
              textDirection: TextDirection.ltr,
              enabled: enabled,
              onTap: onTap,
              minLines: minLine,
              maxLines: maxLines,
              maxLength: maxLength,
              readOnly: isReadOnly,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              textInputAction: textInputAction,
              onChanged: (str) => onChange(str),
              keyboardType: keyboard,
              controller: controller,
              inputFormatters: inputFormatters,
              // obscureText: isObSecure ? isPass
              //     ? authScreenVM.isPassVisible
              //     : isRePass
              //         ? authScreenVM.isRePassVisible
              //         : authScreenVM.isOldPassVisible : false,
              style: context.bodyMedium?.copyWith(
                color: AppTheme.primaryColor,
              ),
              cursorColor: AppTheme.primaryColor,
              cursorWidth: Dimensions.inputFieldCursorWidth,
              cursorHeight: Dimensions.inputFieldCursorHeight,
              decoration: InputDecoration(
                suffixIcon: _buildSuffixIcon(),
                prefixIcon: isPhone
                    ? InkWell(
                        onTap: () {
                          // open phone bottom sheet here
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                authenticationScreenVM.phoneCountryCodeWithPlus,
                                style: context.bodyMedium?.copyWith(
                                  color: AppTheme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  maxHeight: 80,
                  maxWidth: 80,
                ),
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: Dimensions.customIconSize,
                  maxWidth: Dimensions.customIconSize,
                ),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryColor,
                    width: Dimensions.inputFieldBorderWidth,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryColor,
                    width: Dimensions.inputFieldBorderWidth,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: hintText,
                labelStyle: context.bodyLarge,
                hintStyle: context.bodyMedium?.copyWith(
                  color: AppTheme.primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.w300,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryColor,
                    width: Dimensions.inputFieldBorderWidth,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                  borderSide: const BorderSide(
                    color: AppTheme.primaryColor,
                    width: Dimensions.inputFieldBorderWidth,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                  borderSide: BorderSide(
                    color: AppTheme.redColor,
                    width: Dimensions.inputFieldBorderWidth,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.borderRadius),
                  borderSide: BorderSide(
                    color: AppTheme.redColor,
                    width: Dimensions.inputFieldBorderWidth,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (isSocial) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SvgPicture.asset(
          socialIcon!,
          height: Dimensions.iconSize,
          width: Dimensions.iconSize,
          color: AppTheme.blackColor,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
