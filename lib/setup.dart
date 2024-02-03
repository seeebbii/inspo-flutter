import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:inspo/config/locator.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/data/source/local/hive_database.dart';
import 'package:inspo/data/source/local/shared_pref.dart';
import 'package:inspo/utils/base_helper.dart';
import 'package:inspo/utils/constants/string.constant.dart';
import 'package:inspo/utils/firebase_helper.dart';
import 'package:inspo/utils/logger.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   // Check the platform
  //   // if the platform is not huawei, then initialize firebase
  //   String device = await BaseHelper.getDeviceType();
  //   if (device != StringConstants.huawei) {
  //     await Firebase.initializeApp().then((value) => Log.d("Firebase Initialized"));
  //     FirebaseHelper.instance.initFCMConfigs();
  //     await FirebaseHelper.analytics.setAnalyticsCollectionEnabled(true);
  //     await FirebaseHelper.crashlytics.setCrashlyticsCollectionEnabled(true);
  //     // Adding the observer to the go-router
  //     AppRouter.observers?.add(FirebaseHelper.analyticsObserver);
  //     FlutterError.onError = (errorDetails) {
  //       FirebaseHelper.logError(errorDetails.exception, errorDetails.stack ?? StackTrace.current);
  //     };
  //
  //     PlatformDispatcher.instance.onError = (error, stack) {
  //       FirebaseHelper.logError(error, stack, fatal: true);
  //       return true;
  //     };
  //
  //   } else {
  //     // TODO :: Uncomment this after adding the agconnect-services.json file for dev environment
  //     FirebaseHelper.instance.initializeHMSConfigs();
  //   }
  // } catch (e) {
  //   Log.e("Firebase Initialization Error: $e");
  // }
  Log();
  GetLocator.setupLocator();
  tz.initializeTimeZones();
  await SharedPref.init();
  await HiveDatabase.init();
  await initializeDateFormatting();
}
