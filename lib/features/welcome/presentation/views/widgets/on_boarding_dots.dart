import 'package:curely/features/welcome/presentation/view_models/on_boarding_entity.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingDots extends StatelessWidget {
  const OnBoardingDots({super.key, required this.position});

  final double position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: onBoardingPages.length,
      position: position,
      decorator: DotsDecorator(
        size: const Size(8, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(25),
        ),
        activeSize: const Size(20, 8),
      ),
    );
  }
}
