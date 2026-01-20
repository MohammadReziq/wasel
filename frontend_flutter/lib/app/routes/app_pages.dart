import 'package:frontend_flutter/app/routes/app_routes.dart';
import 'package:frontend_flutter/app/view/screen/home_screen.dart';
import 'package:frontend_flutter/app/view/screen/splash_screen.dart';
import 'package:frontend_flutter/app/view/screen/onBoarding_screen.dart';
import 'package:frontend_flutter/app/view/screen/pre_permission_screen.dart';
import 'package:frontend_flutter/app/view/screen/city_picker_screen.dart';
import 'package:frontend_flutter/app/view/screen/login_screen.dart';
import 'package:frontend_flutter/app/controller/onboarding/onboarding_controller.dart';
import 'package:frontend_flutter/app/controller/auth/auth_controller.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    // Splash Screen (Initial)
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),

    // Onboarding
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => OnboardingScreen(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),

    // Pre-Permission Screen
    GetPage(
      name: AppRoutes.prePermissionScreen,
      page: () => const PrePermissionScreen(),
    ),

    // City Picker
    GetPage(
      name: AppRoutes.cityPickerScreen,
      page: () => const CityPickerScreen(),
    ),

    // Login Screen
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
    ),

    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
  ];
}
