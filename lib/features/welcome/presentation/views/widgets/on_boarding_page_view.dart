import 'package:curely/constants.dart';
import 'package:curely/features/welcome/presentation/views/widgets/page_view_unit.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        ...onBoardingPages(context).map((e) {
          return PageViewUnit(onBoardingModel: e);
        }),
      ],
    );
  }
}
