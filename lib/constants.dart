import 'package:flutter/material.dart';
import 'core/utils/assets.dart';
import 'features/welcome/presentation/view_models/on_boarding_model.dart';
import 'package:intl/intl.dart';

const kTransitionDuration = Duration(milliseconds: 250);
const Color kPrimaryColor = Color.fromRGBO(122, 122, 255, 1);
const Color kBlueColor = Color(0xff0D47A1);
const Color kDarkBlueColor = Color(0xff2B475E);
const Color kGrayColor = Color(0xffBDBDBD);
const double kHorizontalPadding = 30;
const double kBottomPadding = 30;
const kIsOnBoardingViewSeen = "kIsOnBoardingViewSeen";
bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

const List<OnBoardingModel> onBoardingPages = [
  OnBoardingModel(
    image: AssetsData.kTrack,
    title: 'Track your medicines',
    subTitle: 'Never forget to take your medicines again.',
  ),
  OnBoardingModel(
    image: AssetsData.kReminder,
    title: 'Get reminders',
    subTitle: 'Receive reminders when it is time to take your medicines.',
  ),
  OnBoardingModel(
    image: AssetsData.kOrganizer,
    title: 'Organize your medicines',
    subTitle: 'Keep all your medicines organized in one place.',
  ),
  OnBoardingModel(
    image: AssetsData.kStay,
    title: 'Stay healthy',
    subTitle: 'Stay on top of your health and never miss a dose again.',
  ),
];
