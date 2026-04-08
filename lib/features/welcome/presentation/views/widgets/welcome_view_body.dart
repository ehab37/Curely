import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CacheHelper.getData(key: AppTextConstants.kThemeKey);
    return Column(
      children: [
        const Spacer(flex: 3),
        Text(
          context.tr("welcome"),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(context.tr("to"), style: Theme.of(context).textTheme.titleLarge),
        10.verticalSpacing,
        Text(
          context.tr("title"),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.8,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              theme == AppTextConstants.dark
                  ? AssetsConstants.kLogoDark
                  : AssetsConstants.kLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Spacer(),
        CustomContainer(
          border: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingConstants.horizontalPadding,
            ),
            child: Column(
              children: [
                const Spacer(flex: 4),
                CustomButton(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    context.tr("login"),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoutesConstants.kLoginView);
                  },
                ),
                30.verticalSpacing,
                CustomButton(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Text(
                    context.tr("register"),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoutesConstants.kRegisterView);
                  },
                ),
                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
