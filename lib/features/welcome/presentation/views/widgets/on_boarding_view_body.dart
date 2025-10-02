import 'package:curely/core/widgets/custom_text_button.dart';
import 'package:curely/features/welcome/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomTextButton(onPressed: (){},text: "Skip",),
          Expanded(child: OnBoardingPageView()),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
