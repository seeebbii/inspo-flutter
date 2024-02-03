import 'package:inspo/config/app_local_auth.dart';
import 'package:inspo/presentation/notifiers/connection.notifier.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GetLocator{
  static GetIt getIt = GetIt.instance;

  static void setupLocator(){
    getIt.registerSingleton<GlobalKey<ScaffoldMessengerState>>(GlobalKey<ScaffoldMessengerState>());
    getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
    getIt.registerLazySingleton<ConnectionNotifier>(() => ConnectionNotifier());
    getIt.registerLazySingleton<AppLocalAuth>(() => AppLocalAuth());

  }

  // Get locator
  static T get<T extends Object>() => getIt.get<T>();
}