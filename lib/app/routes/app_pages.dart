import 'package:get/get.dart';

import '../modules/EditProfileScreen/bindings/edit_profile_screen_binding.dart';
import '../modules/EditProfileScreen/views/edit_profile_screen_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/ProfileScreen/bindings/profile_screen_binding.dart';
import '../modules/ProfileScreen/views/profile_screen_view.dart';
import '../modules/SignUpScreen/bindings/sign_up_screen_binding.dart';
import '../modules/SignUpScreen/views/sign_up_screen_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/VerifyOtpScreen/bindings/verify_otp_screen_binding.dart';
import '../modules/VerifyOtpScreen/views/verify_otp_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => const SignUpScreenView(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP_SCREEN,
      page: () => const VerifyOtpScreenView(),
      binding: VerifyOtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
      children: [],
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_SCREEN,
      page: () => const EditProfileScreenView(),
      binding: EditProfileScreenBinding(),
    ),
  ];
}
