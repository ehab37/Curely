import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/features/welcome/presentation/view_models/on_boarding_entity.dart';
import 'package:flutter/material.dart';

class PageViewUnit extends StatelessWidget {
  const PageViewUnit({super.key, required this.onBoardingModel});

  final OnBoardingEntity onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 2 / 3.25,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(onBoardingModel.image),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 8),
          Text(onBoardingModel.title, style: Styles.style28),
          Text(
            onBoardingModel.subTitle,
            style: Styles.style18.copyWith(
              color: AppColors.primary.withAlpha(160),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
