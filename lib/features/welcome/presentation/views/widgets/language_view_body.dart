import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/title_sub_title_back.dart';
import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:curely/features/welcome/presentation/cubits/selection_cubit.dart';
import 'package:curely/features/welcome/presentation/views/widgets/custom_animated_container.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, String>(
      builder: (context, selectedLanguageCode) {
        final bool isArabicSelected =
            selectedLanguageCode == AppTextConstants.kArabic;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingConstants.horizontalPadding,
              vertical: 12,
            ),
            child: Column(
              children: [
                TitleSubTitleBack(
                  title: S.of(context).chooseLanguage,
                  subTitle: S.of(context).chooseLanguageSubTitle,
                ),
                Spacer(),
                CustomAnimatedContainer(
                  isArabicContainer: false,
                  isArabicLanguage: isArabicSelected,
                ),
                Spacer(),
                CustomAnimatedContainer(
                  isArabicContainer: true,
                  isArabicLanguage: isArabicSelected,
                ),
                Spacer(),
                40.verticalSpacing,
                CustomButton(
                  onPressed: () {
                    final localeCubit = context.read<LanguageCubit>();
                    final String finalLanguageCode = context
                        .read<SelectionCubit>()
                        .state;
                    localeCubit.changeLanguage(finalLanguageCode);
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoutesConstants.kOnBoardingView);
                  },
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  child: Text(
                    S.of(context).confirm,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: SpacingConstants.bottomPadding - 12),
              ],
            ),
          ),
        );
      },
    );
  }
}
