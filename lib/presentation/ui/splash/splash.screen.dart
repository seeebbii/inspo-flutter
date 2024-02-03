import 'package:flutter/material.dart';
import 'package:inspo/config/app_theme.dart';
import 'package:inspo/config/router/app_router.dart';
import 'package:inspo/data/source/local/hive_database.dart';
import 'package:inspo/presentation/notifiers/connection.notifier.dart';
import 'package:inspo/presentation/notifiers/language.notifier.dart';
import 'package:inspo/utils/base_helper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool authenticated = false;

  @override
  void initState() {
    BaseHelper.hideStatusBar();
    BaseHelper.setPreferredOrientation();
    // Monitor network connection
    context.read<ConnectionNotifier>().startMonitoring();
    // Navigate to screens initialization
    Future.delayed(const Duration(seconds: 3), () async {
      await _preStartupCheck();
    });
    super.initState();
  }

  Future<void> _preStartupCheck() async {
    BaseHelper.showStatusBar();
    if(HiveDatabase.getValue(HiveDatabase.loggedInUser) == true) {
      // Navigate the user to root screen

    }else{
      // Check if the user has completed the on boarding flow
      if(HiveDatabase.getValue(HiveDatabase.onBoardingFlowCompleted) == true) {
        // Navigate the user to authentication screen

      }else{
        // Navigate the user to on boarding screen\
        AppRouter.router.go(AppRouter.onBoardingScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    LanguageNotifier languageNotifier = context.read<LanguageNotifier>();
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
