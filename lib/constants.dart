import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'core/utils/assets.dart';
import 'features/welcome/presentation/view_models/on_boarding_model.dart';

const kTransitionDuration = Duration(milliseconds: 400);
const Color kPrimaryColor = Color.fromRGBO(122, 122, 255, 1);
const Color kBrightBlueColor = Color(0xff347AF0);
const Color kBlueColor = Color(0xff0D47A1);
const Color kClaimingTealColor = Color(0xff00C4B8);
const Color kOffWhiteColor = Color(0xffF7F8FC);
const Color kNavyColor = Color(0xff0E3F78);
const Color kDarkBlueColor = Color(0xff0B2347);
const Color kGrayColor = Color(0xffBDBDBD);
const Color kDarkGrayColor = Color(0xff212121);
const Color kLightGrayColor = Color(0xffE0E0E0);
const Color kErrorColor = Color(0xffF44336);
const Color kWarningColor = Color(0xffFFC107);
const Color kSuccessColor = Color(0xff4CAF50);
const double kHorizontalPadding = 24;
const double kBottomPadding = 30;
const kIsOnBoardingViewSeen = "kIsOnBoardingViewSeen";
const kIsArabic = "kIsArabic";

List<OnBoardingModel> onBoardingPages(context) {
  return [
    OnBoardingModel(
      image: AssetsData.kTrack,
      title: S.of(context).onBoardingTitle1,
      subTitle: S.of(context).onBoardingSubTitle1,
    ),
    OnBoardingModel(
      image: AssetsData.kReminder,
      title: S.of(context).onBoardingTitle2,
      subTitle: S.of(context).onBoardingSubTitle2,
    ),
    OnBoardingModel(
      image: AssetsData.kOrganizer,
      title: S.of(context).onBoardingTitle3,
      subTitle: S.of(context).onBoardingSubTitle3,
    ),
    OnBoardingModel(
      image: AssetsData.kStay,
      title: S.of(context).onBoardingTitle4,
      subTitle: S.of(context).onBoardingSubTitle4,
    ),
  ];
}
