import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/cache_helper.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_button.dart';
import 'package:curely/features/welcome/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: (pageController.hasClients ? currentPage : 0) != 3,
            child: CustomTextButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kWelcomeView);
                CacheHelper.putBoolData(key: kIsOnBoardingViewSeen, value: true);
              },
              text: "Skip",
            ),
          ),
          Expanded(child: OnBoardingPageView(pageController: pageController)),
          DotsIndicator(
            dotsCount: onBoardingPages.length,
            position: pageController.hasClients ? pageController.page! : 0,
            decorator: DotsDecorator(
              activeColor: kBlueColor,
              color: kGrayColor,
              size: Size(12, 12),
              activeSize: Size(16, 16),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: (pageController.hasClients ? currentPage : 0) == 3,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: CustomButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kWelcomeView);
                CacheHelper.putBoolData(key: kIsOnBoardingViewSeen, value: true);
              },
              backgroundColor: kBlueColor,
              child: Text("Get Started", style: Styles.style20),
            ),
          ),
          SizedBox(height: kBottomPadding),
        ],
      ),
    );
  }
}
