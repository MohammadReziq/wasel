import 'package:frontend_flutter/app/core/constants/app_image_assets.dart';
import 'package:frontend_flutter/app/data/models/onBoarding_model.dart';

List<OnboardingModel> onBoardingData = [
  OnboardingModel(
    imageUrl: AppImageAssets.image1,
    title:
        'أهلاً بك في تطبيق قٌرب ...يتيح لك التطبيق معرفة مواقيت الصلاة واتجاه القبلة ...',
  ),
  OnboardingModel(
    imageUrl: AppImageAssets.image2,
    title: 'أداء الصلوات بشكل تفاعلي \n  و الحصول على سجل شهري بالنتائج .',
  ),
];
