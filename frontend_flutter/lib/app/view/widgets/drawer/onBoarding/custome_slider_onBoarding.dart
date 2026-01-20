import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';
import 'package:frontend_flutter/app/data/dataSource/onBoarding_data.dart';

class CustomeSliderOnboarding extends StatelessWidget {
  const CustomeSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                '${onBoardingData[index].title}',
                style: TextStyle(color: AppColors.black),
              ),
              SizedBox(height: 30),
              Image.asset(onBoardingData[index].imageUrl),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
