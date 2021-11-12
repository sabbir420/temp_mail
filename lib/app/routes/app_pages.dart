import 'package:get/get.dart';

import 'package:domain_lists/app/modules/home/bindings/home_binding.dart';
import 'package:domain_lists/app/modules/home/views/home_view.dart';
import 'package:domain_lists/app/modules/messages/bindings/messages_binding.dart';
import 'package:domain_lists/app/modules/messages/views/messages_view.dart';
import 'package:domain_lists/app/modules/signin/bindings/signin_binding.dart';
import 'package:domain_lists/app/modules/signin/views/signin_view.dart';
import 'package:domain_lists/app/modules/signup/bindings/signup_binding.dart';
import 'package:domain_lists/app/modules/signup/views/signup_view.dart';
import 'package:domain_lists/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:domain_lists/app/modules/splashScreen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
  ];
}
