import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/locator.dart';
import 'package:inspo/utils/constants/string.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:inspo/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto/crypto.dart';

class BaseHelper {



  static String emailAddressRegExp = r'^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})$';
  static String strongPasswordRegExp = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static String passwordUppercaseRegExp = r'(?=.*?[A-Z])';
  static String passwordLowercaseRegExp = r'(?=.*?[a-z])';
  static String passwordNumericRegExp = r'(?=.*?[0-9])';
  static String passwordSpecialRegExp = r'(?=.*?[!@#\$&*~])';

  static String mapWeekDayShortName(int day) {
    String keyword = '';
    switch(day) {
      case 1: keyword = "MON"; break;
      case 2: keyword = "TUE"; break;
      case 3: keyword = "WED"; break;
      case 4: keyword = "THU"; break;
      case 5: keyword = "FRI"; break;
      case 6: keyword = "SAT"; break;
      case 7: keyword = "SUN"; break;
    }
    return keyword;
  }

  static String mapWeekDayKeyword(int day) {
    String keyword = '';
    switch(day) {
      case 1: keyword = "MO"; break;
      case 2: keyword = "TU"; break;
      case 3: keyword = "WE"; break;
      case 4: keyword = "TH"; break;
      case 5: keyword = "FR"; break;
      case 6: keyword = "SA"; break;
      case 7: keyword = "SU"; break;
    }
    return keyword;
  }

  static String mapMonthName(int day) {
    String keyword = '';
    switch(day) {
      case 1: keyword = "January"; break;
      case 2: keyword = "February"; break;
      case 3: keyword = "March"; break;
      case 4: keyword = "April"; break;
      case 5: keyword = "May"; break;
      case 6: keyword = "June"; break;
      case 7: keyword = "July"; break;
      case 8: keyword = "August"; break;
      case 9: keyword = "September"; break;
      case 10: keyword = "October"; break;
      case 11: keyword = "November"; break;
      case 12: keyword = "December"; break;
    }
    return keyword;
  }

  static String mapMonthShortName(int day) {
    String keyword = '';
    switch(day) {
      case 1: keyword = "Jan"; break;
      case 2: keyword = "Feb"; break;
      case 3: keyword = "Mar"; break;
      case 4: keyword = "Apr"; break;
      case 5: keyword = "May"; break;
      case 6: keyword = "Jun"; break;
      case 7: keyword = "Jul"; break;
      case 8: keyword = "Aug"; break;
      case 9: keyword = "Sep"; break;
      case 10: keyword = "Oct"; break;
      case 11: keyword = "Nov"; break;
      case 12: keyword = "Dec"; break;
    }
    return keyword;
  }

  static String capitalizeText(String s) {
    String text = "";
    s = s.trim();
    if(s.isNotEmpty) {
      text = s[0].toUpperCase() + s.substring(1);
    }
    return text.trim();
  }

  static String capitalizeWords(String s) {
    String text = "";
    s = s.trim();
    if(s.isNotEmpty) {
      List<String> words = s.split(" ");
      for(String work in words) {
        text += (" ${work[0].toUpperCase()}${work.substring(1)}");
      }
    }
    return text.trim();
  }

  static String displayDateI(String date) {
    String formattedDateTime = "";
    DateTime today = DateTime.now();
    DateTime given = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);
    //.add(DateTime.now().timeZoneOffset);
    if(today.year == given.year) { formattedDateTime = DateFormat('EEE, d LLL hh:mm a').format(given); }
    else { formattedDateTime = DateFormat('EEE, d LLL yyyy hh:mm a').format(given); }

    return formattedDateTime;
  }

  static String displayDateII(String date, {String locale = "en"}) {
    String formattedDateTime = "";
    DateTime today = DateTime.now();
    DateTime given = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);//.add(DateTime.now().timeZoneOffset);

    if(today.year == given.year) { formattedDateTime = DateFormat('EEE, d LLL hh:mm a', locale).format(given); }
    else { formattedDateTime = DateFormat('d/MM/yyyy hh:mm a', locale).format(given); }

    return formattedDateTime;
  }

  static String displayDateTime(String date) {
    String formattedDateTime = "";
    DateTime today = DateTime.now();
    DateTime given = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);//.add(DateTime.now().timeZoneOffset);

    if(today.year == given.year) { formattedDateTime = DateFormat('EEE, d LLL hh:mm a').format(given); }
    else { formattedDateTime = DateFormat('d.MM.yyyy hh:mm a').format(given); }
    return formattedDateTime;
  }

  static String displayJustDate(String date, {String locale = "en"}) {
    var dateLocal = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);//.add(DateTime.now().timeZoneOffset);
    return DateFormat(locale == 'en' ? "d/MM/yyyy" :'yyyy/MM/d', locale).format(dateLocal);
  }

  static String displayJustDateI(String date, {String locale = 'en'}) {
    String formattedDateTime = "";
    DateTime given = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);//.add(DateTime.now().timeZoneOffset);
    formattedDateTime = DateFormat('EEE, d LLL yyyy', locale).format(given);
    return formattedDateTime;
  }

  static String displayJustTime(String date) {
    var dateLocal = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);//.add(DateTime.now().timeZoneOffset);
    return DateFormat('HH:mm').format(dateLocal);
  }

  static String displayJustDateTime(String date) {
    var dateLocal = DateTime(DateTime.parse(date).year, DateTime.parse(date).month, DateTime.parse(date).day, DateTime.parse(date).hour, DateTime.parse(date).minute, DateTime.parse(date).second);//.add(DateTime.now().timeZoneOffset);
    return DateFormat('d.MM.yyyy HH.mm').format(dateLocal);
  }

  static String displayJustMonthYear(String date) {
    return DateFormat('MMM yyyy').format(DateTime.parse(date).toLocal());
  }

  static String displayFullMonthYear(String date, {String en = "en"}) {
    return DateFormat('LLLL yyyy', en).format(DateTime.parse(date).toLocal());
  }

  static String displayTime(String time) {
    String datetime  = DateFormat('yyyy-MM-dd $time').format(DateTime.now());
    var dateLocal = DateTime(DateTime.parse(datetime).year, DateTime.parse(datetime).month, DateTime.parse(datetime).day, DateTime.parse(datetime).hour, DateTime.parse(datetime).minute, DateTime.parse(datetime).second);
    return DateFormat('hh:mm a').format(dateLocal);
  }

  static String displayNumberAsText(int val) {
    if(val < 10) { return '0$val'; }
    return val.toString();
  }

  static NumberFormat amountFormat({required String decimals, String locale = 'en'}) {
    // print('current locale: $locale');
    late NumberFormat numberFormat;
    switch(decimals) {
      case "0": numberFormat = NumberFormat("#,##0", locale); break;
      case "2": numberFormat = NumberFormat("#,##0.00", locale); break;
      case "3": numberFormat = NumberFormat("#,##0.000", locale); break;
    }
    return numberFormat;
  }

  static void setPreferredOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static void showSnackBar(String message, {required BuildContext context}) {

    // Get it from locator
    final scaffoldMessengerKey = GetLocator.get<GlobalKey<ScaffoldMessengerState>>();

    // Hide the current Snackbar if it is already displayed
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message, style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold, color: AppTheme.whiteColor),),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static Future<Map<dynamic, dynamic>> readJsonFile(String path) async {
    final content = await rootBundle.loadString(path);
    return await jsonDecode(content);
  }

  static Future<void> launchEmail(String email) async {
    Uri uri = Uri(scheme: 'mailto', path: email);
    // Launch url
    if(await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Log.e('Could not launch ${uri.toString()}');
    }
  }

  static Future<void> launchDialPad(String mobileNumber) async {
    Uri uri = Uri(scheme: 'tel', path: mobileNumber);
    // Launch url
    if(await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Log.e('Could not launch ${uri.toString()}');
    }
  }

  static void launchWhatsappUrl(String mobileNumber) async {
    String url = "https://wa.me/$mobileNumber";
    if(await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    } else {
    Log.e('Could not launch $url');
    }
  }

  static void launchProvidedUrl(String url) async {
     // Launch url
      if(await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        Log.e('Could not launch $url');
      }
  }

  // CACHE NETWORK WIDGET HERE
  static Widget loadNetworkImage(String url, BoxFit fit,
      {double? height, double? width}) {
    return CachedNetworkImage(
      imageUrl: url,
      fadeInCurve: Curves.easeIn,
      fit: fit,
      width: width,
      height: height,
      fadeInDuration: const Duration(milliseconds: 500),
      placeholder: (st_, str) {
        return Container(
          height: 50,
          decoration: const BoxDecoration(
              // image: DecorationImage(image: AssetImage(Assets.ahjiliPlaceholder), fit: BoxFit.contain),
              ),
        );
      },
      errorWidget: (context, url, error) => const Center(
          child: Icon(
        Icons.error,
        color: Colors.black,
      )),
    );
  }

  static Widget loadProfilePictureOnPost(String url,
      {double? height = 36.0, double? width = 36.0}) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      fadeInDuration: const Duration(milliseconds: 500),
      fadeInCurve: Curves.easeIn,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
          child: Icon(
        Icons.error,
        color: Colors.black,
      )),
    );
  }

  static CachedNetworkImageProvider loadNetworkImageObject(
    String url,
  ) {
    return CachedNetworkImageProvider(url, errorListener: (err) {
      debugPrint("ERROR LOADING IMAGE");
    });
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat.yMd().format(dateTime);
  }

  static String formatDateWithMonth(DateTime dateTime, {String locale = 'en'}) {
    return DateFormat.yMMMd(locale).format(dateTime);
  }

  static String appFormatDate(DateTime dateTime, {String locale = 'en'}) {
    return DateFormat('yyyy-MM-dd', locale).format(dateTime);
  }

  static String notificationsDateFormat(DateTime date, {String locale = 'en'}){
    return DateFormat('dd MMMM yyyy', locale).format(date);
  }
  // static Future<bool> isPhoneNoValid(String number, String code, String name,
  //     String prefix) async {
  //   PhoneNumberUtil plugin = PhoneNumberUtil();
  //   String springFieldUSASimpleNoRegion = number;
  //   RegionInfo region = RegionInfo(
  //       code: code, name: 'United States', prefix: int.parse(prefix));
  //   bool isValid =
  //   await plugin.validate(springFieldUSASimpleNoRegion, region.code);
  //   return isValid;
  // }

  static RegExp numberFormatterRegEx = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String Function(Match) mathFunc = (Match match) => '${match[1]},';

  static String formatNumber({required String number}) {
    return number.replaceAllMapped(numberFormatterRegEx, mathFunc);
  }

  // Hashing function to hash the pin code using crypto package
  static String hashString(String input) {
    final bytes = utf8.encode(input); // convert input into bytes
    final digest = sha256.convert(bytes); // hash the bytes using SHA-256
    Log.i('Hash pin code: ${digest.toString()}');
    Log.i('Actual pin code: $input');
    return digest.toString(); // returns a hex-encoded hash string
  }

  // A function that returns me either the phone is IOS, ANDROID or HUAWEI
  static Future<String> getDeviceType() async {
    if (Platform.isIOS) {
      return StringConstants.ios;
    } else if (Platform.isAndroid) {
      var manufacturer = await DeviceInfoPlugin().androidInfo;
      if (manufacturer.manufacturer == StringConstants.huawei) {
        return StringConstants.huawei;
      } else {
        return StringConstants.android;
      }
    } else {
      return StringConstants.unknown;
    }
  }

  static Future<bool> isHuawei() async {
    if (Platform.isIOS) {
      return false;
    } else if (Platform.isAndroid) {
      var manufacturer = await DeviceInfoPlugin().androidInfo;
      if (manufacturer.manufacturer == StringConstants.huawei) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // get current app version number
  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // get current app build number
  static Future<String> getAppBuild() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

}
