import 'dart:developer';

import '../bindings/home_binding.dart';
import '../bindings/login/login_binding.dart';

import '../bindings/signup_binding.dart';
import '../middlewares/auth_middleware.dart';

import '../screens/home/home_screen.dart';

import '../screens/signup/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/login/login_screen.dart';
part 'app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()],
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.SIGNUP,
        page: () => const SignupScreen(),
        binding: SignupBinding(),
        transition: Transition.noTransition),
  ];
}
