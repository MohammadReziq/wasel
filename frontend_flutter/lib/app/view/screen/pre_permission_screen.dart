import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';
import 'package:frontend_flutter/app/controller/onboarding/onboarding_controller.dart';
import 'package:frontend_flutter/app/view/widgets/onboarding/gradient_button.dart';

/// Pre-Permission Screen for Location
/// Soft prompt to explain why location is needed before system dialog
class PrePermissionScreen extends StatelessWidget {
  const PrePermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if device language is Arabic
    final isArabic = Get.locale?.languageCode == 'ar' ||
        Localizations.localeOf(context).languageCode == 'ar';

    return GetBuilder<OnboardingController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteCard,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Spacer(),
                  // Illustration
                  _buildIllustration(),
                  const SizedBox(height: 48),
                  // Title
                  Text(
                    isArabic ? 'تفعيل الموقع' : 'Enable Location',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description
                  Text(
                    isArabic
                        ? 'للحصول على مواقيت الصلاة الدقيقة واتجاه القبلة الصحيح، يحتاج تطبيق قُرب لمعرفة موقعك.'
                        : 'To get accurate prayer times and Qibla direction, Qurb needs to know your location.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Privacy note
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shield_rounded,
                          color: AppColors.primary600,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            isArabic
                                ? 'موقعك يُستخدم فقط لحساب المواقيت ولا يُشارك مع أحد'
                                : 'Your location is only used to calculate prayer times and is never shared',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.primary700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Buttons
                  Obx(() => GradientButton(
                        text: isArabic ? 'تفعيل الموقع' : 'Enable Location',
                        icon: Icons.location_on_rounded,
                        isLoading: controller.isLocationLoading.value,
                        onPressed: controller.onAllowLocation,
                      )),
                  const SizedBox(height: 16),
                  // Manual selection option
                  GradientButton(
                    text: isArabic ? 'اختيار المدينة يدوياً' : 'Select City Manually',
                    icon: Icons.edit_location_alt_rounded,
                    isOutlined: true,
                    onPressed: controller.selectCityManually,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIllustration() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary100,
            AppColors.primary200,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.location_on_rounded,
            size: 70,
            color: AppColors.primary600,
          ),
          Positioned(
            right: 25,
            top: 25,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.secondary500,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mosque_rounded,
                size: 20,
                color: AppColors.primary800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
