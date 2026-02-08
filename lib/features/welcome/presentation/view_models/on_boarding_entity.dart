import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/generated/l10n.dart';

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
      image: AssetsConstants.kTrack,
      title: S.of(context).onBoardingTitle1,
      subTitle: S.of(context).onBoardingSubTitle1,
    ),
    OnBoardingEntity(
      image: AssetsConstants.kReminder,
      title: S.of(context).onBoardingTitle2,
      subTitle: S.of(context).onBoardingSubTitle2,
    ),
    OnBoardingEntity(
      image: AssetsConstants.kOrganizer,
      title: S.of(context).onBoardingTitle3,
      subTitle: S.of(context).onBoardingSubTitle3,
    ),
    OnBoardingEntity(
      image: AssetsConstants.kStay,
      title: S.of(context).onBoardingTitle4,
      subTitle: S.of(context).onBoardingSubTitle4,
    ),
  ];
}
