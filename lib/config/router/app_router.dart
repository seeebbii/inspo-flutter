import 'package:inspo/config/locator.dart';
import 'package:inspo/config/router/custom_navigator_observer.dart';
import 'package:inspo/presentation/ui/authentication/forgot_password.screen.dart';
import 'package:inspo/presentation/ui/authentication/login.screen.dart';
import 'package:inspo/presentation/ui/authentication/otp_verification.screen.dart';
import 'package:inspo/presentation/ui/authentication/setup_profile.screen.dart';
import 'package:inspo/presentation/ui/authentication/signup.screen.dart';
import 'package:inspo/presentation/ui/onboarding/onboarding.screen.dart';
import 'package:inspo/presentation/ui/root/calendar/calendar.root.screen.dart';
import 'package:inspo/presentation/ui/root/dashboard/dashboard.root.screen.dart';
import 'package:inspo/presentation/ui/root/root.screen.dart';
import 'package:inspo/presentation/ui/root/settings/pages/payment.page.dart';
import 'package:inspo/presentation/ui/root/settings/settings.root.screen.dart';
import 'package:inspo/presentation/ui/splash/splash.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inspo/utils/firebase_helper.dart';
import 'package:inspo/utils/logger.dart';

class AppRouter {
  // WELCOME ROUTE
  static const String splashScreen = '/';
  static const String updateAppScreen = '/updateAppScreen';

  // BOTTOM NAVIGATION BAR SCREENS
  static const String rootDashboardScreen = '/root-dashboard-screen';
  static const String rootCalendarScreen = '/root-calendar-screen';
  static const String rootSettingsScreen = '/root-settings-screen';

  // ON BOARDING SCREEN
  static const String onBoardingScreen = '/on-boarding-screen';

  // REDIRECTION ON BASIS OF SESSION
  static const String verifySession = '/verify-session';

  // AUTH ROUTE
  static const String loginScreen = '/login-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String otpVerificationScreen = '/otp-verification-screen';
  static const String changePasswordScreen = '/change-password-screen';
  static const String passcodeScreen = '/passcode-screen';
  static const String signupScreen = '/signup-screen';
  static const String setupProfileScreen = '/setup-profile-screen';

  // LINK EMPLOYER SCREEN ROUTE
  static const String linkInvitationScreen = '/link-invitation-screen';
  static const String iBanVerificationScreen = '/iban-verification-screen';
  static const String linkAuthorizationScreen = '/link-authorization-screen';
  static const String verifyEmployeeOTPScreen = '/verify-employee-otp-screen';

  // ROOT SCREEN ROUTE
  static const String rootScreen = '/root-screen';

  // DASHBOARD SCREEN ROUTE
  static const String allAtmsScreen = '/all-atms-screen';
  static const String withdrawalHistoryScreen = '/withdrawal-history-screen';
  static const String notificationScreen = '/notification-screen';
  static const String detailedNotificationPage= 'detailed-notification-page';

  static const String manageProfileScreen = '/manage-profile-screen';
  static const String manageProfileAvatarPage = 'manage-profile-avatar-page'; // Manage Profile Screen Pages
  static const String employerManagementScreen = '/employer-management-screen';
  static const String employeeDetailsPage = 'employee-details-page';
  static const String employeeAuthorizationAgreementPage = 'employee-authorization-agreement-page';

  // SETTINGS SCREEN ROUTES
  static const String settingsScreen = '/settings-screen';
  static const String paymentPage = 'payment-page';
  // SECURITY PAGES
  static const String pinPage = 'pin-page';
  static const String confirmPinPage = 'confirm-pin-page';
  static const String changePinPage = 'change-pin-page';
  static const String changePasswordPage = 'change-password-page';

  static const String notificationPage = 'notification-page';
  static const String locationPage = 'location-page';
  static const String languagePage = 'language-page';

  static const String aboutScreen = '/about-screen';
  // ABOUT PAGES
  static const String aboutUsPage = 'about-us-page';
  static const String termsAndConditionsPage = '/terms-and-conditions-page';
  static const String privacyPolicyPage = 'privacy-policy-page';

  // SUPPORT SCREEN PAGES
  static const String supportScreen = '/support-screen';
  static const String faqPage = 'faq-page';
  static const String contactUsPage = 'contact-us-page';
  static const String contactUsFormPage = 'contact-us-form-page';

  final navigatorKey = GlobalKey<NavigatorState>();
  static final CustomNavigatorObserver navigatorObserver = CustomNavigatorObserver();
  static List<NavigatorObserver>? observers = [
    CustomNavigatorObserver(),
  ];

  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    observers: observers,
    navigatorKey: GetLocator.get<GlobalKey<NavigatorState>>(),
    initialLocation: splashScreen,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: splashScreen,
        path: splashScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const SplashScreen(),
        ),
      ),

      GoRoute(
        name: onBoardingScreen,
        path: onBoardingScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const OnBoardingScreen(),
        ),
      ),

      GoRoute(
        name: loginScreen,
        path: loginScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),

      GoRoute(
        name: signupScreen,
        path: signupScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const SignupScreen(),
        ),
      ),

      GoRoute(
        name: setupProfileScreen,
        path: setupProfileScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const SetupProfileScreen(),
        ),
      ),

      GoRoute(
        name: forgotPasswordScreen,
        path: forgotPasswordScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const ForgotPasswordScreen(),
        ),
      ),

      GoRoute(
        name: otpVerificationScreen,
        path: otpVerificationScreen,
        pageBuilder: (context, state) => _getPageRoute(
          context: context,
          state: state,
          child: const OTPVerificationScreen(),
        ),
      ),

      StatefulShellRoute.indexedStack(

        builder: (context, state, navigationShell) => RootScreen(key: state.pageKey, child: navigationShell),
          branches: [

            StatefulShellBranch(
              initialLocation: rootDashboardScreen,
                routes: [
                  GoRoute(
                    name: rootDashboardScreen,
                    path: rootDashboardScreen,
                    pageBuilder: (context, state) => _getPageRoute(
                      context: context,
                      state: state,
                      child: const DashboardRootScreen(),
                    ),
                  ),
                ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: rootCalendarScreen,
                  path: rootCalendarScreen,
                  pageBuilder: (context, state) => _getPageRoute(
                    context: context,
                    state: state,
                    child: const CalendarRootScreen(),
                  ),
                ),
              ],
            ),

            StatefulShellBranch(
              routes: [
                GoRoute(
                  name: rootSettingsScreen,
                  path: rootSettingsScreen,
                  pageBuilder: (context, state) => _getPageRoute(
                    context: context,
                    state: state,
                    child: const SettingsRootScreen(),
                  ),
                  routes: [
                    GoRoute(
                      name: paymentPage,
                      path: paymentPage,
                      pageBuilder: (context, state) => _getPageRoute(
                        context: context,
                        state: state,
                        child: const PaymentPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]
      ),

      // ShellRoute(
      //     navigatorKey: shellNavigatorKey,
      //     pageBuilder: (context, state, child) => _getPageRoute(
      //       context: context,
      //       state: state,
      //       child: const RootScreen(),
      //     ),
      //     routes: [
      //
      //     ]
      // ),


    ],
  );

  // FUNCTION THAT HANDLES ANIMATION
  static CustomTransitionPage _getPageRoute({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    // Log.d('from the app router: ${state.fullPath}');
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      }
    );
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
