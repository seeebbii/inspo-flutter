import 'package:family_tree/config/router/app_router.dart';
import 'package:family_tree/data/repositories/authentication.service.repository.dart';
import 'package:family_tree/domain/repositories/authentication.repository.dart';
import 'package:get_it/get_it.dart';

class GetLocator{
  static GetIt getIt = GetIt.instance;

  static void setupLocator(){
    getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationServiceRepository());
    // getIt.registerLazySingleton<RouteGenerator>(() => RouteGenerator());
  }

  // Get locator
  static T get<T extends Object>() => getIt.get<T>();
}