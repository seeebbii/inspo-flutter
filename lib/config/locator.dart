import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/data/repositories/authentication.service.repository.dart';
import 'package:clean_architecture_template/domain/repositories/authentication.repository.dart';
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