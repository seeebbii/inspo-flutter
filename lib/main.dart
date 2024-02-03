import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:huawei_push/huawei_push.dart' as hms;
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/setup.dart';
import 'package:inspo/utils/logger.dart';
import 'app.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Log.d('Handling a background message ${message.toMap()}');
}

void backgroundMessageCallback(hms.RemoteMessage remoteMessage) async {
  String? data = remoteMessage.data;
  Log.d('Handling a background message ${remoteMessage.toMap()}');

  hms.Push.localNotification({
    hms.HMSLocalNotificationAttr.TITLE: '[Headless] DataMessage Received',
    hms.HMSLocalNotificationAttr.MESSAGE: data
  });
}

void onDidReceiveBackgroundNotificationResponse (NotificationResponse? payload) async {
  // for background isolate
  if (payload?.payload != null) {
    if (payload?.payload?.startsWith(AppRouter.detailedNotificationPage) ??
        false) {
      AppRouter.router.push("${AppRouter.notificationScreen}/${payload?.payload}");
    }
  }
}

FutureOr<void> main() async {
  await setup();
  runApp(const App());
}