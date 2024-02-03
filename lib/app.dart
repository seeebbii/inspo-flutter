import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspo/utils/constants/assets.constant.dart';
import 'package:inspo/utils/dimensions.dart';
import 'package:inspo/utils/extensions/context.extension.dart';
import 'package:secure_application/secure_application.dart';
import 'app/providers/multi_providers.dart';
import 'config/app_theme.dart';
import 'config/locator.dart';
import 'config/router/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProviders(
      child: MaterialApp.router(
        scaffoldMessengerKey: GetLocator.get<GlobalKey<ScaffoldMessengerState>>(),
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        title: "Inspo",
        // builder: (context, widget) {
        //   return SecureGate(
        //     blurr: 10, // the amount of blur
        //     opacity: 0.3, // the opacity of the barrier
        //     lockedBuilder: (context, secureNotifier) {
        //       return Container(
        //         height: context.height,
        //         width: context.width,
        //         color: AppTheme.primaryColor,
        //         child: Center(
        //           child: Image.asset(Assets.ratbiAppLogo, width: 200, height: 150,),
        //         ),
        //       );
        //     },
        //     child: AppBuilder(
        //       widget: widget!,
        //     ),
        //   );
        // },
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        backButtonDispatcher: AppRouter.router.backButtonDispatcher,
      ),
    );
  }
}
