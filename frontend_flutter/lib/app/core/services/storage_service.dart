import 'package:shared_preferences/shared_preferences.dart';

/// Storage Service for managing local storage using SharedPreferences
/// Handles onboarding state, language preferences, and location settings
class StorageService {
  static StorageService? _instance;
  static SharedPreferences? _prefs;

  // Keys
  static const String _keyIsFirstTime = 'is_first_time';
  static const String _keyLanguageCode = 'language_code';
  static const String _keySelectedCity = 'selected_city';
  static const String _keySelectedCountry = 'selected_country';
  static const String _keyLocationGranted = 'location_granted';
  static const String _keyOnboardingCompleted = 'onboarding_completed';

  /// Get singleton instance
  static Future<StorageService> getInstance() async {
    _instance ??= StorageService();
    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // FIRST TIME / ONBOARDING
  // ══════════════════════════════════════════════════════════════════════════

  /// Check if this is the user's first time opening the app
  bool get isFirstTime => _prefs?.getBool(_keyIsFirstTime) ?? true;

  /// Mark that the user has opened the app before
  Future<void> setNotFirstTime() async {
    await _prefs?.setBool(_keyIsFirstTime, false);
  }

  /// Check if onboarding is completed
  bool get isOnboardingCompleted =>
      _prefs?.getBool(_keyOnboardingCompleted) ?? false;

  /// Mark onboarding as completed
  Future<void> setOnboardingCompleted() async {
    await _prefs?.setBool(_keyOnboardingCompleted, true);
    await setNotFirstTime();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LANGUAGE
  // ══════════════════════════════════════════════════════════════════════════

  /// Get saved language code (null if not set)
  String? get languageCode => _prefs?.getString(_keyLanguageCode);

  /// Save language code
  Future<void> setLanguageCode(String code) async {
    await _prefs?.setString(_keyLanguageCode, code);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LOCATION
  // ══════════════════════════════════════════════════════════════════════════

  /// Check if location permission was granted
  bool get isLocationGranted => _prefs?.getBool(_keyLocationGranted) ?? false;

  /// Set location permission status
  Future<void> setLocationGranted(bool granted) async {
    await _prefs?.setBool(_keyLocationGranted, granted);
  }

  /// Get saved city
  String? get selectedCity => _prefs?.getString(_keySelectedCity);

  /// Save selected city
  Future<void> setSelectedCity(String city) async {
    await _prefs?.setString(_keySelectedCity, city);
  }

  /// Get saved country
  String? get selectedCountry => _prefs?.getString(_keySelectedCountry);

  /// Save selected country
  Future<void> setSelectedCountry(String country) async {
    await _prefs?.setString(_keySelectedCountry, country);
  }

  /// Save city and country together
  Future<void> setLocation({
    required String city,
    required String country,
  }) async {
    await setSelectedCity(city);
    await setSelectedCountry(country);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CLEAR
  // ══════════════════════════════════════════════════════════════════════════

  /// Clear all stored data (for debugging/testing)
  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
