import 'package:get/get.dart';
import 'package:frontend_flutter/app/core/services/storage_service.dart';
import 'package:frontend_flutter/app/core/services/location_service.dart';
import 'package:frontend_flutter/app/routes/app_routes.dart';

/// Onboarding Controller using GetX
/// Manages onboarding flow, page navigation, and location permissions
class OnboardingController extends GetxController {
  // Page controller state
  final currentPage = 0.obs;
  final totalPages = 3;

  // Services
  late StorageService _storageService;
  late LocationService _locationService;

  // Location state
  final isLocationLoading = false.obs;
  final locationInfo = Rxn<LocationInfo>();

  @override
  void onInit() {
    super.onInit();
    _initServices();
  }

  Future<void> _initServices() async {
    _storageService = await StorageService.getInstance();
    _locationService = LocationService.getInstance();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PAGE NAVIGATION
  // ══════════════════════════════════════════════════════════════════════════

  /// Go to next page or proceed to permission screen
  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    } else {
      // Last page, go to pre-permission screen
      Get.toNamed(AppRoutes.prePermissionScreen);
    }
  }

  /// Go to previous page
  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  /// Update current page (for PageView)
  void onPageChanged(int page) {
    currentPage.value = page;
  }

  /// Skip onboarding and go to pre-permission
  void skip() {
    Get.toNamed(AppRoutes.prePermissionScreen);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LOCATION PERMISSION
  // ══════════════════════════════════════════════════════════════════════════

  /// Request location permission (soft prompt accepted)
  Future<bool> requestLocationPermission() async {
    isLocationLoading.value = true;

    try {
      final granted = await _locationService.requestPermission();
      await _storageService.setLocationGranted(granted);

      if (granted) {
        // Get location info
        final info = await _locationService.getCurrentLocationInfo();
        if (info != null) {
          locationInfo.value = info;
          await _storageService.setLocation(
            city: info.city,
            country: info.country,
          );
        }
      }

      isLocationLoading.value = false;
      return granted;
    } catch (e) {
      isLocationLoading.value = false;
      return false;
    }
  }

  /// Handle "Allow Location" button press
  Future<void> onAllowLocation() async {
    final granted = await requestLocationPermission();
    if (granted) {
      _completeOnboardingAndNavigate();
    } else {
      // Permission denied, offer manual selection
      Get.snackbar(
        'تنبيه',
        'يمكنك اختيار مدينتك يدوياً',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Navigate to manual city picker
  void selectCityManually() {
    Get.toNamed(AppRoutes.cityPickerScreen);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CITY SELECTION
  // ══════════════════════════════════════════════════════════════════════════

  /// Save manually selected city
  Future<void> saveSelectedCity(String city, String country) async {
    await _storageService.setLocation(city: city, country: country);
    _completeOnboardingAndNavigate();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // COMPLETE ONBOARDING
  // ══════════════════════════════════════════════════════════════════════════

  /// Mark onboarding as complete and navigate to login
  Future<void> _completeOnboardingAndNavigate() async {
    await _storageService.setOnboardingCompleted();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
