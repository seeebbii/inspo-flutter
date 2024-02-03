import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inspo/utils/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:crypto/crypto.dart';

class HiveDatabase{
  static String languagesKey = 'languagesKey';
  static String countriesKey = 'countriesKey';
  static String selectedCountryKey = 'selectedCountryKey';
  static String atmsKey = 'atmsKey';
  static String userBoxKey = 'userBoxKey';
  static String userNotificationsBoxKey = 'userNotificationsBoxKey';
  static String linkBoxKey = 'linkBoxKey';
  static String currentSelectedLinkKey = 'currentSelectedLinkKey';
  static String calendarTimelineBoxKey = 'calendarTimelineBoxKey';
  static String withdrawalHistoryBoxKey = 'withdrawalHistoryBoxKey';
  static String calendarTimelineKey = 'calendarTimelineKey';
  static String appTermsKey = 'appTermsKey';
  static String appAboutKey = 'appAboutKey';
  static String errorMessagesKey = 'errorMessagesKey';
  static String appFaqsKey = 'appFaqsKey';
  static String supportSubjectsKey = 'supportSubjectsKey';
  static String userNotificationsKey = 'userNotificationsKey';

  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
  static String loggedInUser = 'loggedInUser';
  static String loginCheck = 'loginCheck';
  static String currentLang = 'currentLang';
  static String onBoardingFlowCompleted = 'onBoardingFlowCompleted';
  static String selectedLanguage = 'selectedLanguage';
  static String locationPermissionGranted = 'locationPermissionGranted';
  static String allowNotifications = 'allowNotifications';
  static String pinSetup = 'pinSetup';
  static String biometricSetup = 'biometricSetup';
  static String hashedPin = 'hashedPin';

  static String appBox = 'app';
  static String inspoEncryptedKey = 'inspoEncryptedKey';

  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  factory HiveDatabase() => _instance;
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Box? _box;
  Box get box => _box!;

  // App Content Box
  static Box? _appContentBox;
  static Box get appContentBox => _appContentBox!;


  static Future<void> init() async {
    try {
      await Hive.initFlutter();
      // Getting the encryption key from secure storage
      String? encryptionKeyString = await secureStorage.read(key: inspoEncryptedKey);
      if(encryptionKeyString == null){
        final generateEncryptionKey = Hive.generateSecureKey();
        await secureStorage.write(key: inspoEncryptedKey, value: base64UrlEncode(generateEncryptionKey));
        // Re-fetching the encryption key from secure storage
        encryptionKeyString = await secureStorage.read(key: inspoEncryptedKey);
      }
      // Converting the encryption key from string to Uint8List
      final encryptionKey = base64Url.decode(encryptionKeyString ?? '');

      // Registering Model Adapter
      registerRequiredAdapters();
      _instance._box = await Hive.openBox(appBox,  encryptionCipher: HiveAesCipher(encryptionKey));
      _appContentBox = await Hive.openBox(languagesKey, encryptionCipher: HiveAesCipher(encryptionKey));

      Log.d('AppBox Open: ${_instance._box?.isOpen}');
      Log.d('AppContentBox Open: ${_appContentBox?.isOpen}');
    } catch (e) {
      // _instance._box?.clear();
      // _appContentBox?.clear();
      Log.e("Hive Database Initialization Error: $e");
    }
  }

  static void storeValue(String key, dynamic value) async {
    _instance._box!.put(key, value);
  }

  static dynamic getValue(String key){
    return _instance._box?.get(key);
  }


  static void registerRequiredAdapters(){

  }

}