import 'package:curely/core/constants/assets_constants.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingEntity {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingEntity({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

final List<OnBoardingEntity> onBoardingPages = [
  OnBoardingEntity(
    image: AssetsConstants.kOrganizer,
    title: "onboarding_title_1".tr(),
    subTitle: "onboarding_subtitle_1".tr(),
  ),
  OnBoardingEntity(
    image: AssetsConstants.kReminder,
    title: "onboarding_title_2".tr(),
    subTitle: "onboarding_subtitle_2".tr(),
  ),
  OnBoardingEntity(
    image: AssetsConstants.kChatBot,
    title: "onboarding_title_3".tr(),
    subTitle: "onboarding_subtitle_3".tr(),
  ),
];
