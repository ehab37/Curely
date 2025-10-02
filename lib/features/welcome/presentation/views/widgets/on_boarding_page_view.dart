import 'package:curely/constants.dart';
import 'package:curely/features/welcome/presentation/views/widgets/page_view_unit.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        ...onBoardingPages.map((e) {
          return PageViewUnit(onBoardingModel: e);
        }),
      ],
    );
  }
}
