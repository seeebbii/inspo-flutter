import 'package:clean_architecture_template/config/router/custom_navigator_observer.dart';
import 'package:clean_architecture_template/presentation/ui/authentication/application_under_eview_screen.dart';
import 'package:clean_architecture_template/presentation/ui/authentication/concept/inspo_concept_sign_up_screen.dart';
import 'package:clean_architecture_template/presentation/ui/authentication/forgot_password_screen.dart';
import 'package:clean_architecture_template/presentation/ui/authentication/login_screen.dart';
import 'package:clean_architecture_template/presentation/ui/authentication/otp_screen.dart';
import 'package:clean_architecture_template/presentation/ui/authentication/influencer/sign_up_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/InspoNeedHelpScreen.dart';
import 'package:clean_architecture_template/presentation/ui/home/IspoHomeMainScreen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_edit_profile_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/concept/concept_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/edit_profile_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_home_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_notification_screen.dart';
import 'package:clean_architecture_template/presentation/ui/home/inspo_past_converage_screen.dart';
import 'package:clean_architecture_template/presentation/ui/splash/splash.screen.dart';
import 'package:clean_architecture_template/presentation/ui/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';

import '../../presentation/ui/home/concept/concept_home_main_screen.dart';
import '../../presentation/ui/home/inspo_settings_screen.dart';


class AppRouter {
  // WELCOME ROUTE
  static const String splashScreen = '/';

  // ON BOARDING SCREEN
  static const String onBoardingScreen = '/on-boarding-screen';

  // AUTH ROUTE
  static const String loginScreen = '/login-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String verifyPhoneScreen = '/verify-phone-screen';
  static const String otpVerificationScreen = '/otp-verification-screen';
  static const String resetPasswordScreen = '/reset-password-screen';
  static const String changePassword = '/change-password-screen';
  static const String signupScreen = '/signup-screen';
  static const String conceptSignupScreen = '/concept-signup-screen';
  static const String applicationUnderReviewScreen = '/application-under-review-screen';

  // PROFILE SETUP ROUTE
  static const String createProfileScreen = '/create-profile-screen';
  static const String setupInfoScreen = '/setup-info-screen';
  static const String setupPhotoScreen = '/setup-photo-screen';
  static const String setupVideoScreen = '/setup-video-screen';
  static const String lifeStoryScreen = '/life-story-screen';
  static const String invitationScreen = '/invitation-screen';
  static const String referralSourceScreen = '/referral-source-screen';

  // HOME ROUTE
  static const String homeScreen = '/home-screen';
  static const String homeMainScreen = '/home-main-screen';
  static const String welcomeScreen = '/welcome-screen';
  static const String notificationScreen = '/notification-screen';
  static const String settingsScreen = '/settings-screen';
  static const String editProfileScreen = '/edit-profile-screen';
  static const String needHelpScreen = '/need-help-screen';
  static const String pastCoverageScreen = '/past-coverage-screen';
  static const String conceptHomeScreen = '/concept-home-screen';
  static const String conceptHomeMainScreen = '/concept-home-main-screen';
  static const String conceptEditProfileScreen = '/concept-edit-profile-screen';

  static final GoRouter router = GoRouter(
    observers: [CustomNavigatorObserver()],
    navigatorKey: Get.key,
    initialLocation: loginScreen,
    routes: <RouteBase>[
      _buildRoute(splashScreen, const SplashScreen()),
      _buildRoute(loginScreen, LoginScreen()),
      _buildRoute(forgotPasswordScreen, const ForgotPasswordScreen()),
      _buildRoute(signupScreen, const SignUpScreen()),
      _buildRoute(otpVerificationScreen,const  OtpScreen()),
      _buildRoute(otpVerificationScreen, const OtpScreen()),
      _buildRoute(applicationUnderReviewScreen, const ApplicationUnderReviewScreen()),
      _buildRoute(welcomeScreen, const WelcomeScreen()),
      _buildRoute(homeScreen, const InspoHomeScreen()),
      _buildRoute(notificationScreen, const InspoNotificationScreen()),
      _buildRoute(settingsScreen, const InspoSettingsScreen()),
      _buildRoute(homeMainScreen, InspoHomeMainScreen()),
      _buildRoute(editProfileScreen, const InspoEditProfileScreen()),
      _buildRoute(needHelpScreen, InspoNeedHelpScreen()),
      _buildRoute(pastCoverageScreen, const InspoPastCoverageScreen()),
      _buildRoute(conceptSignupScreen, const InspoConceptSignUpScreen()),
      _buildRoute(conceptHomeMainScreen, const ConceptHomeMainScreen()),
      _buildRoute(conceptEditProfileScreen, const InspoConceptEditProfileScreen()),
    ],
  );

  // FUNCTION THAT CREATE ROUTES
  static RouteBase _buildRoute(String path, Widget page) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => _getPageRoute(
        context: context,
        state: state,
        child: page,
      ),
    );
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static CustomTransitionPage _getPageRoute({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    // return MaterialPageRoute(builder: (ctx) => child);
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
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
