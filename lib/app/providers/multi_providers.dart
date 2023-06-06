import 'package:flutter/material.dart';
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

        ChangeNotifierProvider<AuthenticationNotifier>(
          create: (BuildContext context) => AuthenticationNotifier(
              authenticationRepository: GetLocator.getIt()),
        ),
      ],
      child: child,
    );
  }
}
