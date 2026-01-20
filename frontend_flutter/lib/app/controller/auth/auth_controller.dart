import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend_flutter/app/core/services/auth_service.dart';
import 'package:frontend_flutter/app/data/models/user_model.dart';
import 'package:frontend_flutter/app/routes/app_routes.dart';

/// Authentication Controller
/// Manages authentication state and operations
class AuthController extends GetxController {
  // Services
  final AuthService _authService = AuthService.getInstance();

  // Observable state
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isGoogleSignInLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _checkAuthState();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // AUTHENTICATION STATE
  // ══════════════════════════════════════════════════════════════════════════

  /// Check if user is already authenticated
  Future<void> _checkAuthState() async {
    isLoading.value = true;
    try {
      // Check if user is authenticated with Firebase
      if (_authService.isAuthenticated) {
        final user = await _authService.getStoredUser();
        if (user != null) {
          currentUser.value = user;
        }
      }
    } catch (e) {
      print('Error checking auth state: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => currentUser.value != null;

  // ══════════════════════════════════════════════════════════════════════════
  // GOOGLE SIGN IN
  // ══════════════════════════════════════════════════════════════════════════

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    isGoogleSignInLoading.value = true;
    errorMessage.value = '';

    try {
      final user = await _authService.signInWithGoogle();

      if (user != null) {
        currentUser.value = user;

        // Show success message
        Get.snackbar(
          'نجح تسجيل الدخول',
          'مرحباً ${user.displayName ?? 'بك'}!',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );

        // Navigate to home screen
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        // User cancelled sign-in
        errorMessage.value = 'تم إلغاء تسجيل الدخول';
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth errors
      errorMessage.value = _getArabicErrorMessage(e.code);
      Get.snackbar(
        'خطأ في تسجيل الدخول',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      // Handle other errors
      errorMessage.value = 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
      Get.snackbar(
        'خطأ',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
      print('Error in Google Sign-In: $e');
    } finally {
      isGoogleSignInLoading.value = false;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SIGN OUT
  // ══════════════════════════════════════════════════════════════════════════

  /// Sign out
  Future<void> signOut() async {
    isLoading.value = true;
    try {
      await _authService.signOut();
      currentUser.value = null;

      // Navigate to login screen
      Get.offAllNamed(AppRoutes.loginScreen);

      Get.snackbar(
        'تم تسجيل الخروج',
        'تم تسجيل خروجك بنجاح',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar(
        'خطأ',
        'حدث خطأ أثناء تسجيل الخروج',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
      print('Error signing out: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER METHODS
  // ══════════════════════════════════════════════════════════════════════════

  /// Get Arabic error message from Firebase error code
  String _getArabicErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        return 'يوجد حساب بنفس البريد الإلكتروني بطريقة تسجيل دخول مختلفة';
      case 'invalid-credential':
        return 'بيانات الاعتماد غير صالحة';
      case 'operation-not-allowed':
        return 'تسجيل الدخول بهذه الطريقة غير مفعّل';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب';
      case 'user-not-found':
        return 'لم يتم العثور على المستخدم';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة';
      case 'invalid-verification-code':
        return 'رمز التحقق غير صحيح';
      case 'invalid-verification-id':
        return 'معرّف التحقق غير صحيح';
      case 'network-request-failed':
        return 'فشل الاتصال بالإنترنت. يرجى التحقق من اتصالك';
      case 'too-many-requests':
        return 'تم تجاوز عدد المحاولات. يرجى المحاولة لاحقاً';
      default:
        return 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';
    }
  }

  /// Clear error message
  void clearError() {
    errorMessage.value = '';
  }
}
