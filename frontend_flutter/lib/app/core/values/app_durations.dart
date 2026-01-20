/// مدد الحركات والانتقالات في التطبيق
class AppDurations {
  // Animation Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);
  
  // Page Transitions
  static const Duration pageTransition = Duration(milliseconds: 300);
  
  // Dialog Animations
  static const Duration dialogFadeIn = Duration(milliseconds: 200);
  static const Duration dialogSlideUp = Duration(milliseconds: 250);
  
  // Button Press Feedback
  static const Duration buttonPress = Duration(milliseconds: 100);
  
  // Splash Screen
  static const Duration splash = Duration(seconds: 2);
  
  // Snackbar/Toast
  static const Duration snackbar = Duration(seconds: 3);
  static const Duration toast = Duration(seconds: 2);
  
  // Loading States
  static const Duration loadingMinimum = Duration(milliseconds: 500);
  
  // Debounce (للبحث مثلاً)
  static const Duration debounce = Duration(milliseconds: 500);
  
  // Auto-dismiss
  static const Duration autoDismiss = Duration(seconds: 5);
}
