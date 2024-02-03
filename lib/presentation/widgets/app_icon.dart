import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
                image: AssetImage(Assets.ratbiAppLogo), fit: BoxFit.contain)));
  }
}
