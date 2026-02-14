import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
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
                  languageName: S.of(context).english,
                  languageFlag: AssetsConstants.kUK,
                  onTab: () {
                    context.read<SelectionCubit>().selectLanguage(
                      AppTextConstants.kEnglish,
                    );
                  },
                  boxShadow: !isArabicSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withAlpha(130),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(10, 10),
                          ),
                        ]
                      : null,
                  backgroundColor: !isArabicSelected
                      ? AppColors.primary
                      : AppColors.lightGray,
                  style: !isArabicSelected
                      ? Styles.styleWhite25
                      : Styles.styleBlue25,
                ),
                Spacer(),
                CustomAnimatedContainer(
                  languageName: S.of(context).arabic,
                  languageFlag: AssetsConstants.kEgypt,
                  onTab: () {
                    context.read<SelectionCubit>().selectLanguage(
                      AppTextConstants.kArabic,
                    );
                  },
                  boxShadow: isArabicSelected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withAlpha(130),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(10, 10),
                          ),
                        ]
                      : null,
                  backgroundColor: isArabicSelected
                      ? AppColors.primary
                      : AppColors.lightGray,
                  style: isArabicSelected
                      ? Styles.styleWhite25
                      : Styles.styleBlue25,
                ),
                Spacer(),
                40.verticalSpacing,
                Center(
                  child: CustomButton(
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
                    backgroundColor: AppColors.darkBlue,
                    child: Text(
                      S.of(context).confirm,
                      style: Styles.styleWhite20,
                    ),
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
