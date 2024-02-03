import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/main.dart';
import 'package:inspo/utils/firebase_helper.dart';
import 'package:inspo/utils/logger.dart';

class NotificationService {
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel channel;

  static Future<void> initializePushNotifications() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'inspo',
        importance: Importance.max,
        playSound: true);
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestCriticalPermission: true,
    );
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
      // for main isolate
      if (payload.payload != null) {
        if (payload.payload?.startsWith(AppRouter.detailedNotificationPage) ??
            false) {
          AppRouter.router
              .push("${AppRouter.notificationScreen}/${payload.payload}");
        }
      }
    },
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveBackgroundNotificationResponse);
  }

  // show local notification on receiving a background message with right message content and title
  // create a method for showing the local notifications with a remote message parameter
  static void showLocalNotification(
      RemoteMessage message, String payload) async {
    Log.d("Displaying showLocalNotifications: ${message.toMap()}");
    const myChanel = AndroidNotificationChannel(
        'high_importance_channel', 'High Importance Notifications',
        description: 'inspo', importance: Importance.max, playSound: true);
    flutterLocalNotificationsPlugin
        .show(
            0,
            message.notification?.title ?? "[Empty Title]",
            message.notification?.body ?? "[Empty Body]",
            NotificationDetails(
                android: AndroidNotificationDetails(myChanel.id, myChanel.name,
                    importance: Importance.high,
                    color: AppTheme.primaryColor,
                    playSound: true,
                    icon: '@mipmap/ic_launcher'),
                iOS: const DarwinNotificationDetails(
                  presentAlert: true,
                  presentBadge: true,
                  presentSound: true,
                  attachments: [],
                )),
            payload: payload)
        .onError((error, stackTrace) {
      Log.e("Error displaying showLocalNotifications: $error");
      Log.e('Stack trace: $stackTrace');
    });
  }
}
