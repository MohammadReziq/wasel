import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/theme/app_colors.dart';

class CustomButtonOnboarding extends StatelessWidget {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.green,
      minWidth: 300,
      padding: .all(15),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: () {},
      child: Text('Continue', style: TextStyle(color: AppColors.background)),
    );
  }
}
