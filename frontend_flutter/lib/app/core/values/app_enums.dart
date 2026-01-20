/// Enums المستخدمة في التطبيق
library;

/// أنواع الصلوات
enum PrayerType {
  fajr,
  sunrise,
  dhuhr,
  asr,
  maghrib,
  isha,
}

/// حالة تحميل البيانات
enum LoadingState {
  initial,
  loading,
  success,
  error,
}

/// وضع السمة (Theme)
enum ThemeMode {
  light,
  dark,
  system,
}

/// اللغات المدعومة
enum AppLanguage {
  arabic,
  english,
}

/// نوع الإشعار
enum NotificationType {
  prayer,
  community,
  system,
  reminder,
}

/// حالة الصلاة
enum PrayerStatus {
  upcoming,
  current,
  completed,
  missed,
}

/// مستوى الأهمية
enum Priority {
  low,
  medium,
  high,
  urgent,
}
