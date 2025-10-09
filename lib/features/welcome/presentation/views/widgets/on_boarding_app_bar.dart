import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/cache_helper.dart';
import 'package:curely/core/widgets/custom_text_button.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingAppBar extends StatelessWidget {
  const OnBoardingAppBar({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: (pageController.hasClients ? currentPage : 0) != 3,
          child: CustomTextButton(
            onPressed: () {
              GoRouter.of(
                context,
              ).pushReplacement(AppRouter.kWelcomeView);
              CacheHelper.putBoolData(
                key: kIsOnBoardingViewSeen,
                value: true,
              );
            },
            text: S.of(context).skip,
          ),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(
              context,
            ).push(AppRouter.kLanguageView);
          },
          icon: Icon(
            Icons.language_outlined,
            color: kNavyColor,
            size: 33,
          ),
        ),
      ],
    );
  }
}
