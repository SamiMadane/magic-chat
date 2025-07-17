import 'package:easy_localization/easy_localization.dart';
import 'package:magicchat/core/resourses/assets_manager.dart';
import 'package:magicchat/features/onboarding/data/models/onboarding_model.dart';


 List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: 'onboarding.chat_friends.title'.tr(),
    subtitle: 'onboarding.chat_friends.subtitle.'.tr(),
    imagePath: AssetsManager.onboarding1Image,
  ),
  OnboardingModel(
    title: 'onboarding.chat_ai.title'.tr(),
    subtitle: 'onboarding.chat_ai.subtitle'.tr(),
    imagePath: AssetsManager.onboarding2Image,
  ),
  OnboardingModel(
    title: 'onboarding.chat_offline.title'.tr(),
    subtitle: 'onboarding.chat_offline.subtitle'.tr(),
    imagePath: AssetsManager.onboarding3Image,
  ),
];
