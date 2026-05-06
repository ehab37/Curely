import 'package:curely/core/constants/assets_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

List<OnBoardingEntity> onBoardingPages(BuildContext context) => [
  OnBoardingEntity(
    image: AssetsConstants.kOrganizer,
    title: context.tr("onboarding_title_1"),
    subTitle: context.tr("onboarding_subtitle_1"),
  ),
  OnBoardingEntity(
    image: AssetsConstants.kReminder,
    title: context.tr("onboarding_title_2"),
    subTitle: context.tr("onboarding_subtitle_2"),
  ),
  OnBoardingEntity(
    image: AssetsConstants.kChatBot,
    title: context.tr("onboarding_title_3"),
    subTitle: context.tr("onboarding_subtitle_3"),
  ),
];
