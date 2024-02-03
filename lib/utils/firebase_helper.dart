import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/main.dart';
import 'package:inspo/utils/logger.dart';
import 'package:huawei_push/huawei_push.dart' as hms;
import 'package:inspo/utils/notifications/notifications_service.dart';

class FirebaseHelper {
  // Singleton pattern
  FirebaseHelper._privateConstructor();

  static final FirebaseHelper instance = FirebaseHelper._privateConstructor();

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static FirebaseMessaging get firebaseMessaging => _firebaseMessaging;

  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  static FirebaseAnalytics get analytics => _analytics;

  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  static FirebaseCrashlytics get crashlytics => _crashlytics;

  // Firebase Cloud Messaging (FCM)
  Future<String?> getFirebaseToken() async {
    try{
      String? token = await _firebaseMessaging.getToken();
      return token;
    }catch(e){
      Log.e('FIREBASE TOKEN: $e');
      return null;
    }
  }

  void initFCMConfigs() async {
    await NotificationService.initializePushNotifications();
    configureFCMNotifications();
  }

  int badgeCounter = 0;

  void configureFCMNotifications({
    Function(String?)? onMessage,
    Function(String?)? onLaunch,
    Function(String?)? onResume,
  }) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Log.d("FCM Message onMessage: ${message.toMap()}");
      FlutterAppBadger.updateBadgeCount(badgeCounter++);


      if(message.messageId != null){
        // Navigate the user to the notification details page
        // AppRouter.router.replace(AppRouter.notificationScreen);
        // AppRouter.router.pushNamed(AppRouter.detailedNotificationPage, pathParameters: {'messageId': "${message.messageId}", 'index': "-1"}, extra: null);

        NotificationService.showLocalNotification(message, '${AppRouter.detailedNotificationPage}/${message.messageId}/-1');

      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      badgeCounter = 0;
      FlutterAppBadger.removeBadge();
      Log.d("FCM Message onMessageOpenedApp: ${message.toMap()}");

      Log.d('Message iD: ${message.messageId}');
      if(message.messageId != null){
        // Navigate the user to the notification details page
        // AppRouter.router.replace(AppRouter.notificationScreen);
        AppRouter.router.pushNamed(AppRouter.detailedNotificationPage, pathParameters: {'messageId': "${message.messageId}", 'index': "-1"}, extra: null);
      }

    });

    // Handle when app is terminated
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      badgeCounter = 0;
      FlutterAppBadger.removeBadge();
      Log.d("FCM Message getInitialMessage: ${message?.toMap()}");
      if (message != null) {
        // onLaunch?.call(message.data['customKey']);
        AppRouter.router.pushNamed(AppRouter.detailedNotificationPage, pathParameters: {'messageId': "${message.messageId}", 'index': "-1"}, extra: null);
      }
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }


  // Firebase Analytics
  static FirebaseAnalyticsObserver get analyticsObserver => FirebaseAnalyticsObserver(analytics: _analytics, onError: (error) => Log.e('Firebase Analytics Error: $error'));

  static Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  static Future<void> setUserId({required String? userId}) async {
    await _analytics.setUserId(id: userId,);
  }

  static Future<void> setUserProperties({required String key, String? value}) async {
    await _analytics.setUserProperty(name: key, value: value);
  }

  static Future<void> setCurrentScreen(String screenName, {String? screenClassOverride = 'Flutter'}) async {
    await _analytics.setCurrentScreen(screenName: screenName, screenClassOverride: "$screenClassOverride");
  }

  // Firebase Crashlytics
  static Future<void> logError(Object error, StackTrace stackTrace, {bool fatal = false}) async {
    await _crashlytics.recordError(error, stackTrace, fatal: fatal, printDetails: true);
  }

  static Future<void> log(String message) async {
    await _crashlytics.log(message);
  }

  static Future<void> setCrashlyticsUserId({required String userId}) async {
    await _crashlytics.setUserIdentifier(userId);
  }

  static Future<void> setCrashlyticsUserProperties({required String key, dynamic value}) async {
    await _crashlytics.setCustomKey(key, value);
  }


  // HMS Push Kit (Huawei) CONFIGURATION
  static String hmsToken = 'No token yet';
  static EventChannel TokenEventChannel = EventChannel(hms.RemoteMessage.TOKEN);

  void initializeHMSConfigs(){
    initPushListening();
    getHmsToken();
  }

  Future<void> initPlatformState() async {
    TokenEventChannel.receiveBroadcastStream().listen(_onTokenEvent, onError: _onTokenError);
  }

  void _onTokenEvent(event) {
    // This function gets called when we receive the token successfully
    Log.d('On Token Event: $event');
    hmsToken = event.toString();
    Log.d("TOKEN AFTER EVENT: $hmsToken");
    // hms.Push.showToast(event);
  }

  void _onTokenError(error) {
    // token = error;
    Log.e('HMS TOKEN: $error');
    // hms.Push.showToast(error.toString());
  }

  void getHMSToken() async {
    hms.Push.getTokenStream.listen(_onTokenEvent, onError: _onTokenError);
    hms.Push.getToken('');
  }

  void initPushListening(){
    hms.Push.onMessageReceivedStream.listen(_onMessageReceived, onError: _onMessageError);
  }

  void _onMessageReceived(Object event) {
    Log.d("On Message Received: $event");
    // hms.Push.showToast(event);
  }

  void _onMessageError(Object error) {
    Log.e("On Message Error: $error");
    // hms.Push.showToast(error);
  }

  static void getHmsToken() async {
    hms.Push.enableLogger();
    String token;
    try {
      FirebaseHelper.instance.getHMSToken();
    } catch (e) {
      Log.e("Get HMS Token Error: $e");
    }
  }

  void backgroundMessageCallback(hms.RemoteMessage remoteMessage) async {
    String? data = remoteMessage.data;
    Log.d('Handling a background message ${remoteMessage.toMap()}');

    hms.Push.localNotification({
      hms.HMSLocalNotificationAttr.TITLE: '[Headless] DataMessage Received',
      hms.HMSLocalNotificationAttr.MESSAGE: data
    });
  }
  
}

