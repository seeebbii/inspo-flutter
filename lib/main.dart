import 'package:flutter/material.dart';
import 'config/locator.dart';
import 'config/router/custom_navigator_observer.dart';
import 'config/scroll_behaviour.dart';
import 'data/source/local/hive_database.dart';
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
