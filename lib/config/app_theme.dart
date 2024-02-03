import 'package:google_fonts/google_fonts.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static Color parseStringToHex(String hex) {
    return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String parseColorToHex(Color color) {
    return color.toString().substring(6, 16).replaceAll('0xff', '#');
  }

  // Define custom colors. The 'guide' color values are from
  // https://material.io/design/color/the-color-system.html#color-theme-creation

  static const Color green = Colors.green;
  static const Color lightGreen = Color(0xFF9FFF99);
  static const Color red = Colors.red;
  static const Color lightRed = Color(0xFFEE9281);
  static const Color orange = Colors.deepOrange;
  static const Color blue = Color(0xFF6C63FF);
  static const Color lightBlue = Color(0xFF81B6EE);
  static const Color lightPurple = Color(0xFF6E85B6);
  static const Color darkPurple = Color(0xFF370BAC);
  static const Color yellow = Colors.yellow;
  static const Color lightYellow = Color(0xFFEEE981);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color darkGrey = Color(0xFF757575);
  static const Color darkGrey2 = Color(0xFF424242);
  static const Color darkGrey3 = Color(0xFF212121);


  static const Color lightLineColor = Color.fromARGB(255, 224, 224, 224);
  static const Color transparent = Colors.transparent;

  static Color appColor = const Color(0xFFCCFF01);
  static Color appBGColor = const Color(0xFF353535);
  static Color firstTop = const Color(0xFF0056A6);
  static Color firstBottom = const Color(0xFF0C81B4);
  static Color secondTop = const Color(0xFF7FC53A);
  static Color secondBottom = const Color(0xFF6CA116);
  static Color thirdTop = const Color(0xFFFF7043);
  static Color thirdBottom = const Color(0xFFFA3E03);
  static Color fourthTop = const Color(0xFFF254CF);
  static Color fourthBottom = const Color(0xFFC811A0);
  static Color orderPriceBorder = const Color(0xFF8EB103);
  static Color orderPriceBG = const Color(0xFF98F500);
  static Color dialogBG = const Color(0xFFECFFA1);

  static const Color darkBackgroundColor = Color(0xFF181C1E);
  static const Color lightGray = Color(0xFFE1E1E1);
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightComponentsColor = Color(0xFF40CAFF);
  static const Color lightCardColor = Color(0xFFF4F8FA);

  static const Color errorColor = Color(0xFFD60000);
  static const Color btnColor = Color(0xFFFF9900);
  static const Color lightTextColor = Color(0xFFF4F8FA);
  static const Color fieldTextColor = Color(0xFFF2F2F2);
  static const Color dotTextColor = Color(0xFF707070);
  static const Color darkTextColor = Color(0xFF181C1E);
  static const Color boxShadowColor = Color(0x1F000000);
  static const Color splashColor = Color(0x1F000000);
  static const Color splashScreenBgColor = Color(0xFFF37D71);
  static const Color graphColorPurple = Color(0xFFC855CB);
  static const Color graphColorOrange = Color(0xFFFF9900);

  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xFF1F1F1F);
  static const Color fieldOutlineColor = Color(0xFF808080);
  static const Color searchHintColor = Color(0xFF888888);
  static const Color textFieldFillColor = Color(0xFFFAFAFA);
  static const Color buyNowButtonColor = Color(0xFFD1F3DD);
  static const Color hintColor = Color(0xFF959595);
  static const Color chatHintColor = Color(0xFFBEBEBE);
  static const Color textFieldUnderline = Color(0xFFDFDFDF);
  static const Color postBodyBackgroundColor = Color(0xFFF5F5F5);
  static const Color homeScreenHorizontalListviewBg = Color(0xFF353536);
  static const Color unSelectedCategoryColor = Color(0xFF4A4A4B);
  static const Color dividerColor = Color(0xFF000000);
  static const Color darkDividerColor = Color(0xFFD9D9D9);

  // ================== APP THEME ================== //
  static const Color primaryColor = Color(0xFF201F21);
  static const Color darkPrimaryColor = Color(0xFF4770DA);
  static const Color gradientStartColor = Color(0xFF817FF1);
  static const Color gradientEndColor = Color(0xFF1665C3);
  static const Color linearBgColor = Color(0xFFF1F1F1);
  static const Color arrowButtonBg = Color(0xFFF2F6FF);
  static const Color labelHintColor = Color(0xFF757575);
  static const Color disableButtonColor = Color(0xFFC5C5C5);
  static const Color lightGreyColor = Color(0xFFF3F3F3);
  static const Color scaffoldBackgroundColor = primaryColor;
  static const Color mainTextColor = Color(0xFF000000);
  static const Color fieldBackgroundColor = Color(0x2e7baade);
  static const Color inspoBlue = Color(0xFF354552);
  static const Color inspoSecondaryBlue = Color(0xFF333c42);
  static const Color inspoLightBlue = Color(0xff6cace3);
  static const Color checkGreenColor = Color(0xff05c36a);
  static const Color errorRedColor = Color(0xffaa2633);
  static const Color darkGreyColor = Color(0xffb4b4b4);
  static const Color secondaryGreyColor = Color(0xffe5e7e9);
  static const Color disabledGreyColor = Color(0xffc3c3c3);
  static Color redColor = Colors.red.shade700;


  static const Color semiWhiteColor = Color(0xfffafafa);
  static const Color navigationIconColor = Color(0xff7f7f7f);

  static const Color inspoPillColor = Color(0xff6cace4);
  static const Color inspoAlternatePillColor = Color(0xffe4e9f1);
  static const Color inspoBubbleColor = Color(0xffa8cdf0);
  static const Color screenBackgroundColor = Color(0xfff3f3f3);


  static LinearGradient elevatedButtonGradient = const LinearGradient(
    colors: <Color>[
      gradientStartColor,
      gradientEndColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color subtitleLightGreyColor = Color(0xFF8391A1);
  static const Color chatFieldBgColor = Color(0xFFF3F9FF);
  static const Color shadowColorHomePage = Color(0xFF000000);
  static const Color unselectedItemColor = Color(0xFF777777);
  static const Color noImageColor = Color(0xFFD9D9D9);
  static const Color viewsContainerColor = Color(0xFFFFF9EF);
  static const Color imageCountContainerColor = Color(0xFF414141);
  static const Color containerBackgroundColor = Color.fromRGBO(0, 0, 0, 0.08);
  static const Color statusTextColor = Color(0xFFB8B5B5);

  static const Color unSelectedNavBarItemColor = Color(0xFF979797);

  static ThemeData get lightTheme {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            // statusBarColor: Colors.orange,
          )
      ),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: Dimensions.h1,
          letterSpacing: 0,
          color: mainTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: Dimensions.h2,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
          color: mainTextColor,
        ),
        displaySmall: TextStyle(
          fontSize: Dimensions.h3,
          letterSpacing: 0,
          color: mainTextColor,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: Dimensions.p1,
          letterSpacing: 0,
          // fontWeight: FontWeight.w700,
          color: mainTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: Dimensions.p2,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
          color: mainTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: Dimensions.p3,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          color: mainTextColor,
        ),
        labelSmall: TextStyle(fontWeight: FontWeight.w300, color: mainTextColor),
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: semiWhiteColor,
      primaryColorLight: const Color(0xFFF1F1F1),
      focusColor: primaryColor,
      brightness: Brightness.light,
      splashColor: transparent,
      indicatorColor: transparent,
      highlightColor: transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      cardColor: whiteColor,
      dividerColor: whiteColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: CupertinoColors.systemGrey, elevation: 3),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 12,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: primaryColor,
          backgroundColor: whiteColor,
          side: const BorderSide(color: primaryColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: primaryColor,
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor), bottomAppBarTheme: const BottomAppBarTheme(color: whiteColor), colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            secondary: const Color(0xFF79A6DC),
            brightness: Brightness.light,
          )
          .copyWith(secondary: primaryColor)
          .copyWith(secondary: primaryColor)
          .copyWith(background: lightBackgroundColor)
          .copyWith(error: errorColor).copyWith(background: whiteColor),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            // statusBarColor: Colors.orange,
          )
      ),
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: Dimensions.h1,
          letterSpacing: 0,
          color: whiteColor,
        ),
        displayMedium: TextStyle(
          fontSize: Dimensions.h2,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        displaySmall: TextStyle(
          fontSize: Dimensions.h3,
          letterSpacing: 0,
          color: whiteColor,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: Dimensions.p1,
          letterSpacing: 0,
          // fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        bodyMedium: TextStyle(
          fontSize: Dimensions.p2,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
        bodySmall: TextStyle(
          fontSize: Dimensions.p3,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          color: whiteColor,
        ),
        labelSmall: TextStyle(fontWeight: FontWeight.w300, color: whiteColor),
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: blackColor,
      primaryColorLight: const Color(0xFFF1F1F1),
      focusColor: primaryColor,
      brightness: Brightness.light,
      splashColor: transparent,
      indicatorColor: transparent,
      highlightColor: transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      cardColor: whiteColor,
      dividerColor: whiteColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: CupertinoColors.systemGrey, elevation: 3),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 12,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: whiteColor,
          backgroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: whiteColor,
          backgroundColor: whiteColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor), bottomAppBarTheme: const BottomAppBarTheme(color: whiteColor), colorScheme: ColorScheme.fromSwatch()
        .copyWith(
      secondary: const Color(0xFF79A6DC),
      brightness: Brightness.light,
    )
        .copyWith(secondary: whiteColor)
        .copyWith(secondary: whiteColor)
        .copyWith(background: lightBackgroundColor)
        .copyWith(error: errorColor).copyWith(background: whiteColor),
    );
  }
}

extension MyThemeData on ThemeData {
  bool get isDarkTheme => brightness == Brightness.dark;
  bool get isLightTheme => brightness == Brightness.light;
}
