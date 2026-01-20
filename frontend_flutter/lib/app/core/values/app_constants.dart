/// ثوابت عامة للتطبيق
class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = 'v1';
  static const int connectionTimeout = 30000; // milliseconds
  static const int receiveTimeout = 30000; // milliseconds
  
  // Storage Keys (للحفظ المحلي)
  static const String keyUserToken = 'user_token';
  static const String keyUserId = 'user_id';
  static const String keyUserName = 'user_name';
  static const String keyLanguage = 'language';
  static const String keyThemeMode = 'theme_mode';
  static const String keyNotificationsEnabled = 'notifications_enabled';
  static const String keyPrayerNotifications = 'prayer_notifications';
  static const String keyLocationPermission = 'location_permission';
  
  // Prayer Times Configuration
  static const int calculationMethod = 4; // Muslim World League
  static const int asrMethod = 0; // Standard (Shafi)
  static const int highLatitudeRule = 3; // تعديل الدقائق
  
  // Notification Configuration
  static const int beforePrayerMinutes = 15; // التنبيه قبل الصلاة بـ 15 دقيقة
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int minUsernameLength = 3;
  
  // Date/Time Formats
  static const String dateFormat = 'yyyy/MM/dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy/MM/dd HH:mm';
  
  // App Metadata
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1';
  
  // Social Media Links
  static const String facebookUrl = 'https://facebook.com/wasel';
  static const String twitterUrl = 'https://twitter.com/wasel';
  static const String instagramUrl = 'https://instagram.com/wasel';
  
  // Support
  static const String supportEmail = 'support@wasel.com';
  static const String privacyPolicyUrl = 'https://wasel.com/privacy';
  static const String termsOfServiceUrl = 'https://wasel.com/terms';
}
