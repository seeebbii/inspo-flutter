import 'package:inspo/data/source/local/hive_database.dart';
import 'package:inspo/utils/base_helper.dart';
import 'package:inspo/utils/logger.dart';
import 'package:local_auth/local_auth.dart';

class AppLocalAuth {
  // Singleton Class
  static final AppLocalAuth _singleton = AppLocalAuth._internal();
  factory AppLocalAuth() => _singleton;
  AppLocalAuth._internal();

  // Start writing local authentication methods here
  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<bool> setupPin({required String newPin, required String confirmPin}) async {
    // Compare the pin and save it to the device
    if (newPin == confirmPin) {
      // Hash the pin and save it to the device
      newPin = BaseHelper.hashString(newPin);
      HiveDatabase.storeValue(HiveDatabase.hashedPin, newPin);
      HiveDatabase.storeValue(HiveDatabase.pinSetup, true);
      return true;
    } else {
      return false;
    }
  }

  // Hashed Pin
  //91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203
  Future<bool> verifyPin({required String pin}) async {
    // Get the hashed pin from the device and compare it with the hashed pin
    pin = BaseHelper.hashString(pin);
    String? hashedPin = HiveDatabase.getValue(HiveDatabase.hashedPin) ?? '';
    if (hashedPin != null && hashedPin != '') {
      return hashedPin == pin;
    } else {
      return false;
    }
  }

  Future<String> changePin({required String oldPin, required String newPin, required String confirmPin}) async {
    // Verify the old pin
    bool isOldPinVerified = await verifyPin(pin: oldPin);
    if (isOldPinVerified) {

      // Check if the new pin doesn't match the old pin

      if (oldPin == newPin) {
        return 'same-old-pin';
      }

      if(confirmPin == ''){
        return '';
      }

      // Compare the new pin and save it to the device
      if (newPin == confirmPin) {
        // Hash the pin and save it to the device
        newPin = BaseHelper.hashString(newPin);
        HiveDatabase.storeValue(HiveDatabase.hashedPin, newPin);
        HiveDatabase.storeValue(HiveDatabase.pinSetup, true);
        return 'changed-successfully';
      } else {
        return 'pin-not-matched';
      }
    } else {
      return 'wrong-old-pin';
    }
  }

  Future<void> removePin() async {
    HiveDatabase.storeValue(HiveDatabase.hashedPin, '');
    HiveDatabase.storeValue(HiveDatabase.pinSetup, false);
  }

  Future<bool> isDeviceSupported() async {
    bool isDeviceSupported = false;
    try {
      isDeviceSupported = await localAuthentication.isDeviceSupported();
    } catch (e) {
      Log.e(e);
    }
    return isDeviceSupported;
  }

  Future<bool> checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    } catch (e) {
      Log.e(e);
    }
    return canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = <BiometricType>[];
    try {
      availableBiometrics = await localAuthentication.getAvailableBiometrics();
    } catch (e) {
      Log.e(e);
    }
    return availableBiometrics;
  }

  // Method to authenticate with biometrics or device PIN
  Future<bool> authenticateWithBiometrics() async {
    try {
      return await localAuthentication.authenticate(
        localizedReason: 'authenticate to enable biometric use',
        options: const AuthenticationOptions(
          // Set this to true to show the user an authentication dialog
          // whenever they need to authenticate, for example, when
          // performing a sensitive transaction.
          stickyAuth: false,
          // Set this to false if you want to show the user the
          // authentication dialog less frequently, for example, after
          // a user has just authenticated successfully.
          useErrorDialogs: true,
          sensitiveTransaction: true,
          biometricOnly: false,
        ),
      );
    } catch (e) {
      Log.e(e);
      return false;
    }
  }

  // Method to stop authentication if in progress
  Future<void> stopAuthentication() async {
    try {
      await localAuthentication.stopAuthentication();
    } catch (e) {
      Log.e(e);
    }
  }
}
