import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend_flutter/app/controller/auth/auth_controller.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';

/// Login Screen with Google Sign-In
/// Beautiful RTL-ready design matching the provided mockup
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primary500,
          body: SafeArea(
            child: Column(
              children: [
                // Close button
                _buildCloseButton(),

                // Main content
                Expanded(
                  child: _buildMainContent(controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CLOSE BUTTON
  // ══════════════════════════════════════════════════════════════════════════

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconButton(
          icon: const Icon(Icons.close, color: Colors.white, size: 28),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // MAIN CONTENT
  // ══════════════════════════════════════════════════════════════════════════

  Widget _buildMainContent(AuthController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo placeholder
          _buildLogo(),

          const SizedBox(height: 32),

          // Welcome text
          _buildWelcomeText(),

          const SizedBox(height: 12),

          // Subtitle
          _buildSubtitle(),

          const SizedBox(height: 48),

          // Google Sign-In Button
          _buildGoogleSignInButton(controller),

          const SizedBox(height: 24),

          // Terms and Privacy
          _buildTermsAndPrivacy(),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // UI COMPONENTS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _buildLogo() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.grey200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'logo',
          style: TextStyle(
            color: AppColors.grey500,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Text(
      'مرحباً بك في قُرب',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'سجّل الدخول لمتابعة أوقات الصلاة والقبلة وأكثر من ذلك',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
    );
  }

  Widget _buildGoogleSignInButton(AuthController controller) {
    return Obx(() {
      final isLoading = controller.isGoogleSignInLoading.value;

      return InkWell(
        onTap: isLoading ? null : () => controller.signInWithGoogle(),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border, width: 1.5),
          ),
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary500,
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Icon
                    Image.asset(
                      'assets/images/google_logo.png',
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback if image not found
                        return Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.grey300,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.g_mobiledata,
                            size: 20,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'الدخول باستخدام Google',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }

  Widget _buildTermsAndPrivacy() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'بالمتابعة، أنت توافق على ',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textThird,
          ),
        ),
        InkWell(
          onTap: () {
            // TODO: Navigate to terms
          },
          child: Text(
            'شروط الاستخدام',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          ' و ',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textThird,
          ),
        ),
        InkWell(
          onTap: () {
            // TODO: Navigate to privacy policy
          },
          child: Text(
            'سياسة الخصوصية',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primary500,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
