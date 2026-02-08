import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/theme/app_colors.dart';
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
              ).pushReplacement(AppRoutesConstants.kWelcomeView);
              CacheHelper.putBoolData(
                key: CacheConstants.kIsOnBoardingViewSeen,
                value: true,
              );
            },
            text: S.of(context).skip,
          ),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutesConstants.kLanguageView);
          },
          icon: Icon(
            Icons.language_outlined,
            color: AppColors.primary,
            size: 33,
          ),
        ),
      ],
    );
  }
}
