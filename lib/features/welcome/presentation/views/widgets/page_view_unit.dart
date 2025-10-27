import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/welcome/presentation/view_models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class PageViewUnit extends StatelessWidget {
  const PageViewUnit({super.key, required this.onBoardingModel});

  final OnBoardingModel onBoardingModel;

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
            style: Styles.style18.copyWith(color: kNavyColor.withAlpha(160)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
