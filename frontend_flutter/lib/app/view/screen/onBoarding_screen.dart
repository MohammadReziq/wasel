import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';
import 'package:frontend_flutter/app/controller/onboarding/onboarding_controller.dart';
import 'package:frontend_flutter/app/view/widgets/onboarding/onboarding_page_widget.dart';
import 'package:frontend_flutter/app/view/widgets/onboarding/page_indicator.dart';
import 'package:frontend_flutter/app/view/widgets/onboarding/gradient_button.dart';

/// Onboarding Screen with 3 pages
/// Focuses on value proposition, not how to use
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController = PageController();

  // Onboarding data - bilingual
  List<Map<String, dynamic>> _getPages(bool isArabic) {
    if (isArabic) {
      return [
        {
          'icon': Icons.access_time_filled_rounded,
          'title': 'مواقيت دقيقة',
          'description':
              'احصل على مواقيت الصلاة الدقيقة حسب موقعك الجغرافي، مع تنبيهات قبل كل صلاة.',
        },
        {
          'icon': Icons.people_alt_rounded,
          'title': 'تواصل وتحفّز',
          'description':
              'شارك أصدقاءك وأحبابك وتحفّزوا معاً على المحافظة على الصلاة. قُرب يجمعكم!',
        },
        {
          'icon': Icons.lock_rounded,
          'title': 'خصوصية تامة',
          'description':
              'بياناتك محمية ومشفرة. لا نشارك معلوماتك مع أي طرف ثالث. خصوصيتك أولويتنا.',
        },
      ];
    } else {
      return [
        {
          'icon': Icons.access_time_filled_rounded,
          'title': 'Accurate Prayer Times',
          'description':
              'Get precise prayer times based on your location, with reminders before each prayer.',
        },
        {
          'icon': Icons.people_alt_rounded,
          'title': 'Connect & Motivate',
          'description':
              'Share with friends and family, motivate each other to maintain prayers. Qurb brings you together!',
        },
        {
          'icon': Icons.lock_rounded,
          'title': 'Complete Privacy',
          'description':
              'Your data is protected and encrypted. We never share your information with third parties.',
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if device language is Arabic
    final isArabic = Get.locale?.languageCode == 'ar' ||
        Localizations.localeOf(context).languageCode == 'ar';
    final pages = _getPages(isArabic);

    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteCard,
          body: SafeArea(
            child: Column(
              children: [
                // Skip button
                _buildSkipButton(controller, isArabic),
                // Pages
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      final page = pages[index];
                      return OnboardingPageWidget(
                        imagePath: '',
                        icon: page['icon'] as IconData,
                        title: page['title'] as String,
                        description: page['description'] as String,
                      );
                    },
                  ),
                ),
                // Bottom section
                _buildBottomSection(controller, pages.length, isArabic),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkipButton(OnboardingController controller, bool isArabic) {
    return Align(
      alignment: isArabic ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => controller.currentPage.value < 2
            ? TextButton(
                onPressed: controller.skip,
                child: Text(
                  isArabic ? 'تخطي' : 'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              )
            : const SizedBox(height: 48)),
      ),
    );
  }

  Widget _buildBottomSection(OnboardingController controller, int pagesLength, bool isArabic) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          // Page indicator
          Obx(() => PageIndicator(
                currentPage: controller.currentPage.value,
                totalPages: pagesLength,
              )),
          const SizedBox(height: 32),
          // Next / Get Started button
          Obx(() => GradientButton(
                text: controller.currentPage.value < pagesLength - 1
                    ? (isArabic ? 'التالي' : 'Next')
                    : (isArabic ? 'ابدأ الآن' : 'Get Started'),
                icon: controller.currentPage.value < pagesLength - 1
                    ? (isArabic ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded)
                    : Icons.rocket_launch_rounded,
                onPressed: () {
                  if (controller.currentPage.value < pagesLength - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    controller.nextPage();
                  }
                },
              )),
        ],
      ),
    );
  }
}
