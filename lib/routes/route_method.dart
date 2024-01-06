import 'package:probot/screens/app_screens/subscription/layouts/in_app_list.dart';
import 'package:probot/widgets/common_web_view.dart';

import '../config.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(name: _routeName.splashScreen, page: () => SplashScreen()),
    GetPage(name: _routeName.onBoardingScreen, page: () => OnBoardingScreen()),
    GetPage(name: _routeName.loginScreen, page: () => const LoginScreen()),
    GetPage(name: _routeName.signInScreen, page: () => const SignInScreen()),
    GetPage(
        name: _routeName.restPasswordScreen, page: () => RestPasswordScreen()),
    GetPage(
        name: _routeName.changePasswordScreen,
        page: () => const ChangePasswordScreen()),
    GetPage(name: _routeName.signUpScreen, page: () => const SignUpScreen()),
    GetPage(
        name: _routeName.selectLanguageScreen,
        page: () => SelectLanguageScreen()),
    GetPage(
        name: _routeName.selectCharacterScreen,
        page: () => SelectCharacterScreen()),
    GetPage(name: _routeName.mobileLogin, page: () => MobileLogin()),
    GetPage(name: _routeName.dashboard, page: () => Dashboard()),
    GetPage(name: _routeName.chatLayout, page: () => ChatLayout()),
    GetPage(
        name: _routeName.addFingerprintScreen,
        page: () => AddFingerprintScreen()),
    GetPage(
        name: _routeName.notificationsScreen,
        page: () => NotificationsScreen()),
    GetPage(name: _routeName.imagePreview, page: () => ImagePreview()),
    GetPage(
        name: _routeName.backgroundList, page: () => const BackgroundList()),
    GetPage(name: _routeName.myAccountScreen, page: () => MyAccountScreen()),
    GetPage(
        name: _routeName.fingerprintAndLockSecurity,
        page: () => const FingerprintAndLockSecurity()),
    GetPage(
        name: _routeName.privacyPolicyScreen,
        page: () => PrivacyPolicyScreen()),
    GetPage(name: _routeName.subscriptionPlanList, page: () => Subscription()),

    GetPage(name: _routeName.subscriptionPlan, page: () =>  SubscriptionPlan()),
    GetPage(name: _routeName.chatHistory, page: () => ChatHistoryScreen()),
    GetPage(name: _routeName.commonWebView, page: () => const CommonWebView()),

  ];
}
