import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';

/// Page Indicator Widget for onboarding
/// Shows current page position with animated dots
class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) => _buildDot(index)),
    );
  }

  Widget _buildDot(int index) {
    final isActive = index == currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 28 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary500 : AppColors.grey300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
