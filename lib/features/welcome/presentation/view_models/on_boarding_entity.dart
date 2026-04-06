import 'package:curely/core/constants/assets_constants.dart';

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

List<OnBoardingEntity> onBoardingPages(context) {
  return [
    OnBoardingEntity(
      image: AssetsConstants.kOrganizer,
      title: "Your Health, Organized",
      subTitle:
          "Keep your medicines, prescriptions, X-rays, and lab results in one secure place. No more lost papers or forgotten dates.",
    ),
    OnBoardingEntity(
      image: AssetsConstants.kReminder,
      title: "Never Miss a Dose",
      subTitle:
          "Focus on feeling better while we handle the schedule. Get timely alerts for your medications.",
    ),
    OnBoardingEntity(
      image: AssetsConstants.kChatBot,
      title: "Chat with Dr. Curely",
      subTitle:
          "Not feeling well? Describe your symptoms to AI Health Assistant for reliable guidance and tips on what to do next.",
    ),
  ];
}
