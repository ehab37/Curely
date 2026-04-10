import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/welcome/presentation/view_models/on_boarding_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'on_boarding_app_bar.dart';
import 'on_boarding_dots.dart';
import 'on_boarding_page_view.dart';

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
          OnBoardingAppBar(
            pageController: pageController,
            currentPage: currentPage,
          ),
          Expanded(child: OnBoardingPageView(pageController: pageController)),
          OnBoardingDots(
            position: pageController.hasClients ? pageController.page! : 0,
          ),
          10.verticalSpacing,
          Visibility(
            visible:
                (pageController.hasClients ? currentPage : 0) ==
                onBoardingPages(context).length - 1,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingConstants.horizontalPadding,
              ),
              child: CustomButton(
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutesConstants.kWelcomeView);
                  CacheHelper.putBoolData(
                    key: CacheConstants.kIsOnBoardingViewSeen,
                    value: true,
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                child: Text(
                  context.tr("get_started"),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
          SizedBox(height: SpacingConstants.bottomPadding),
        ],
      ),
    );
  }
}
