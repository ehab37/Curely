import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
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
        final bool isArabicSelected = selectedLanguageCode == kArabic;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: kNavyColor,
                    size: 33,
                  ),
                ),
                SizedBox(height: 30),
                Text(S.of(context).chooseLanguage, style: Styles.styleBlue25),
                Text(
                  S.of(context).chooseLanguageSubTitle,
                  style: Styles.style18,
                ),
                Spacer(),
                CustomAnimatedContainer(
                  languageName: S.of(context).english,
                  languageFlag: AssetsData.kUK,
                  onTab: () {
                    context.read<SelectionCubit>().selectLanguage(kEnglish);
                  },
                  boxShadow: !isArabicSelected
                      ? [
                          BoxShadow(
                            color: kNavyColor.withAlpha(130),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(10, 10),
                          ),
                        ]
                      : null,
                  backgroundColor: !isArabicSelected
                      ? kNavyColor
                      : kLightGrayColor,
                  style: !isArabicSelected
                      ? Styles.styleWhite25
                      : Styles.styleBlue25,
                ),
                Spacer(),
                CustomAnimatedContainer(
                  languageName: S.of(context).arabic,
                  languageFlag: AssetsData.kEgypt,
                  onTab: () {
                    context.read<SelectionCubit>().selectLanguage(kArabic);
                  },
                  boxShadow: isArabicSelected
                      ? [
                          BoxShadow(
                            color: kNavyColor.withAlpha(130),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(10, 10),
                          ),
                        ]
                      : null,
                  backgroundColor: isArabicSelected
                      ? kNavyColor
                      : kLightGrayColor,
                  style: isArabicSelected
                      ? Styles.styleWhite25
                      : Styles.styleBlue25,
                ),
                Spacer(),
                SizedBox(height: 40),
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
                      ).pushReplacement(AppRouter.kOnBoardingView);
                    },
                    backgroundColor: kDarkBlueColor,
                    child: Text(S.of(context).confirm, style: Styles.style20),
                  ),
                ),
                SizedBox(height: kBottomPadding - 12),
              ],
            ),
          ),
        );
      },
    );
  }
}
