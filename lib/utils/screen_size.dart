import 'package:flutter/widgets.dart';

class ScreenSize {
  static double mobileSmall = 320.0;
  static double mobileMedium = 375.0;
  static double mobileLarge = 414.0;
  static double tablet = 600.0; // Starting point for tablets. This can be adjusted.

  static ScreenType getScreenType(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;

    if (deviceWidth < mobileMedium) {
      return ScreenType.mobileSmall;
    } else if (deviceWidth < mobileLarge) {
      return ScreenType.mobileMedium;
    } else if (deviceWidth < tablet) {
      return ScreenType.mobileLarge;
    } else {
      return ScreenType.tablet;
    }
  }
}

enum ScreenType {
  mobileSmall,
  mobileMedium,
  mobileLarge,
  tablet,
}