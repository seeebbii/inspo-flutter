import 'package:clean_architecture_template/app/providers/multi_providers.dart';
import 'package:clean_architecture_template/config/router/app_router.dart';
import 'package:clean_architecture_template/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/app_theme.dart';
import 'config/locator.dart';
import 'config/scroll_behaviour.dart';
import 'data/source/local/hive_database.dart';
import 'data/source/local/shared_pref.dart';
import 'presentation/notifiers/connection.notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log();
  GetLocator.setupLocator();
  await SharedPref.init();
  await ConnectionNotifier().initConnectivity();
  await HiveDatabase.init();
  runApp(const MaterialAppClass());
}

class MaterialAppClass extends StatelessWidget {
  const MaterialAppClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProviders(
      child: GetMaterialApp.router(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        title: "Family Tree",
        builder: (context, widget) {
          return ScrollConfiguration(
              behavior: const ScrollBehaviorModified(), child: widget!);
        },
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        backButtonDispatcher: AppRouter.router.backButtonDispatcher,
      ),
    );
  }
}
