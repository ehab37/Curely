import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/welcome/presentation/view_models/on_boarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewUnit extends StatelessWidget {
  const PageViewUnit({super.key, required this.onBoardingModel});

  final OnBoardingEntity onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(onBoardingModel.image),
            ),
          ),
          Spacer(flex: 2),
          Text(
            onBoardingModel.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          6.verticalSpacing,
          Text(
            onBoardingModel.subTitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
