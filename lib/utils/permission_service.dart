import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService{


  // Getters for permissions status if granted or not
  static Future<bool> get locationPermissionGranted async {
    LocationPermission status = await Geolocator.checkPermission();
    return status == LocationPermission.always || status == LocationPermission.whileInUse;
  }

  static Future<bool> get storagePermissionGranted async {
    if(Platform.isIOS) {
      return await Permission.photos.isGranted;
    } else {
      return await Permission.storage.isGranted;
    }
  }

  static Future<bool> get cameraPermissionGranted async {
    return await Permission.camera.isGranted;
  }

  static Future<bool> get notificationPermissionGranted async {
    return await Permission.notification.isGranted;
  }



  // This method will be used to request the location permission
  // It will return a boolean value
  // true if the permission is granted
  // false if the permission is not granted
  static Future<bool> requestLocationPermission() async {

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }

    return true;
  }

  // This method will be used to check the storage permission
  // It will return a boolean value
  // true if the permission is granted
  // false if the permission is not granted
  static Future<bool> requestStoragePermission() async {
    PermissionStatus permission;

    if(Platform.isIOS){
      permission = await Permission.photos.request();
    }else{
      permission = await Permission.storage.request();
    }

    if(permission == PermissionStatus.granted || permission == PermissionStatus.limited){
      return true;
    }else{
      return false;
    }
  }

  // This method will be used to check the camera permission
  // It will return a boolean value
  // true if the permission is granted
  // false if the permission is not granted
  static Future<bool> requestCameraPermission() async {
    PermissionStatus permission = await Permission.camera.request();
    if(permission == PermissionStatus.granted){
      return true;
    }else{
      return false;
    }
  }

  // This method will be used to check the notification permission
  // It will return a boolean value
  // true if the permission is granted
  // false if the permission is not granted
  static Future<bool> requestNotificationPermission() async {
    PermissionStatus permission = await Permission.notification.request();
    if(permission == PermissionStatus.granted){
      return true;
    }else{
      return false;
    }
  }


}