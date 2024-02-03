import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:inspo/presentation/notifiers/connection.notifier.dart';
import 'package:inspo/presentation/notifiers/language.notifier.dart';
import 'package:inspo/presentation/view_models/authentication_VM.dart';
import 'package:inspo/presentation/view_models/root_navigation_VM.dart';
import 'package:provider/provider.dart';

class MultiProviders extends StatelessWidget {
  const MultiProviders({required this.child, Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<ConnectionNotifier>(
          create: (BuildContext context) => ConnectionNotifier(),
        ),

        ChangeNotifierProvider<LanguageNotifier>(
          create: (BuildContext context) => LanguageNotifier(),
        ),

        ChangeNotifierProvider<AuthenticationScreenVM>(
          create: (BuildContext context) => AuthenticationScreenVM(),
        ),

        ChangeNotifierProvider<RootNavigationVM>(
          create: (BuildContext context) => RootNavigationVM(),
        ),


      ],
      child: child,
    );
  }
}
