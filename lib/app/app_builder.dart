// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:inspo/utils/logger.dart';
// import 'package:provider/provider.dart';
// import 'package:ryalize/config/app_theme.dart';
// import 'package:ryalize/config/router/app_router.dart';
// import 'package:ryalize/config/router/custom_navigator_observer.dart';
// import 'package:ryalize/config/scroll_behaviour.dart';
// import 'package:ryalize/data/source/local/hive_database.dart';
// import 'package:ryalize/presentation/notifiers/authentication.notifier.dart';
// import 'package:ryalize/presentation/notifiers/connection.notifier.dart';
// import 'package:ryalize/presentation/notifiers/language.notifier.dart';
// import 'package:ryalize/presentation/notifiers/loader.notifier.dart';
// import 'package:ryalize/utils/base_helper.dart';
// import 'package:ryalize/utils/constants/assets.constant.dart';
// import 'package:ryalize/utils/dimensions.dart';
// import 'package:ryalize/utils/extensions/context.extension.dart';
// import 'package:ryalize/utils/logger.dart';
// import 'package:secure_application/secure_application_provider.dart';
//
// import '../presentation/view_models/local_auth_VM.dart';
//
// class AppBuilder extends StatefulWidget {
//   final Widget widget;
//
//   const AppBuilder({Key? key, required this.widget}) : super(key: key);
//
//   @override
//   State<AppBuilder> createState() => _AppBuilderState();
// }
//
// class _AppBuilderState extends State<AppBuilder> with WidgetsBindingObserver {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     Log.d('AppLifecycleState: $state');
//     super.didChangeAppLifecycleState(state);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     LanguageNotifier languageNotifier = context.watch<LanguageNotifier>();
//     LoaderNotifier loaderNotifier = context.watch<LoaderNotifier>();
//     ConnectionNotifier connectionNotifier = context.watch<ConnectionNotifier>();
//     return Directionality(
//       textDirection: checkDirectionality(languageNotifier),
//       // Replace with your directionality logic
//       child: Stack(
//         children: [
//           // TODO :: THIS WILL SHOW THE CONNECTION WIDGET OVER EVERY SCREEN
//           // ScrollConfiguration(
//           //     behavior: const ScrollBehaviorModified(),
//           //     child: widget.widget),
//           // // if(!connectionNotifier.isOnline)
//           // AnimatedContainer(
//           //   height: connectionNotifier.isOnline ? 0 : 95,
//           //   width: context.width,
//           //   color: connectionNotifier.isOnline
//           //       ? AppTheme.green
//           //       : AppTheme.errorRedColor,
//           //   alignment: Alignment.bottomCenter,
//           //   padding: const EdgeInsets.only(bottom: Dimensions.verticalSpaces),
//           //   duration: connectionNotifier.isOnline
//           //       ? const Duration(milliseconds: 1400)
//           //       : const Duration(milliseconds: 300),
//           //   curve: Curves.fastOutSlowIn,
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       Text(
//           //         connectionNotifier.isOnline
//           //             ? '${languageNotifier.selectedLanguage.dictionary?['connected'] ?? 'Connected!'}'
//           //             : '${languageNotifier.selectedLanguage.dictionary?['no_internet_connection'] ?? 'No Internet Connection'}',
//           //         style: context.bodyMedium?.copyWith(
//           //             color: AppTheme.whiteColor, fontWeight: FontWeight.bold),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//
//           // TODO :: THIS WILL SHOW THE CONNECTION WIDGET ON TOP OF EVERY SCREEN AND ADJUST SCROLL ACCORDINGLY
//           Column(
//             children: [
//               AnimatedContainer(
//                 height: connectionNotifier.isOnline ? 0 : 100,
//                 width: context.width,
//                 color: connectionNotifier.isOnline
//                     ? AppTheme.green
//                     : AppTheme.errorRedColor,
//                 alignment: Alignment.bottomCenter,
//                 padding: const EdgeInsets.only(bottom: Dimensions.verticalSpaces),
//                 duration: connectionNotifier.isOnline
//                     ? const Duration(milliseconds: 1400)
//                     : const Duration(milliseconds: 300),
//                 curve: Curves.fastOutSlowIn,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           connectionNotifier.isOnline
//                               ? '${languageNotifier.selectedLanguage.dictionary?['connected'] ?? 'Connected!'}'
//                               : '${languageNotifier.selectedLanguage.dictionary?['no_internet_connection'] ?? 'No Internet Connection'}',
//                           style: context.bodyMedium?.copyWith(
//                               color: AppTheme.whiteColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         connectionNotifier.isOnline == false
//                             ? Text(
//                                 '${languageNotifier.selectedLanguage.dictionary?['retrying_connection'] ?? 'Retrying connection attempts.. (${connectionNotifier.retrySeconds})'}',
//                                 style: context.bodySmall
//                                     ?.copyWith(color: AppTheme.whiteColor),
//                               )
//                             : const SizedBox.shrink(),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               ScrollConfiguration(
//                   behavior: const ScrollBehaviorModified(),
//                   child: Expanded(child: widget.widget)),
//             ],
//           ),
//
//           if (loaderNotifier.isLoading)
//             Positioned.fill(
//               child: GestureDetector(
//                 // behavior: HitTestBehavior.opaque, // This is important to block touches
//                 // onTap: () {},
//                 child: Center(
//                   child: Image.asset(
//                     Assets.loader,
//                     width: 100,
//                     height: 100,
//                     color: AppTheme.primaryColor,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   TextDirection checkDirectionality(LanguageNotifier languageNotifier) {
//     if (languageNotifier.selectedLanguage != null) {
//       if (languageNotifier.selectedLanguage.direction == 'rtl') {
//         return TextDirection.rtl;
//       }
//     }
//     return TextDirection.ltr;
//   }
// }
