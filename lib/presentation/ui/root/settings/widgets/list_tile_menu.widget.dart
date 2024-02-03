import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';

class ListTileMenuWidget extends StatelessWidget {
  final String title;
  final bool isSwitch;
  final bool isSwitchValue;
  final VoidCallback? onTap;

  const ListTileMenuWidget(
      {super.key,
      required this.title,
      this.isSwitch = false,
      this.isSwitchValue = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(Dimensions.borderRadius),
        ),
        onTap: onTap,
        title: Text(
          title,
          style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: isSwitch
            ? Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isSwitchValue,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.black,
                  activeTrackColor: Colors.black,
                  trackOutlineColor: MaterialStateProperty.all(Colors.black),
                  onChanged: (val) {
                    onTap?.call();
                  },
                ),
              )
            : const SizedBox.shrink());
  }
}
