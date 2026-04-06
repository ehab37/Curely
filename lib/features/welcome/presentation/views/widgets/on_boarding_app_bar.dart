import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/widgets/custom_text_button.dart';
import 'package:curely/features/welcome/presentation/view_models/on_boarding_entity.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible:
                (pageController.hasClients ? currentPage : 0) !=
                onBoardingPages(context).length - 1,
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
          Spacer(),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              final isDark = state == ThemeMode.dark;
              return IconButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              );
            },
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutesConstants.kLanguageView);
            },
            icon: Icon(Icons.language_outlined),
          ),
        ],
      ),
    );
  }
}
