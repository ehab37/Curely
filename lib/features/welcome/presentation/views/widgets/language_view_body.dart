import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/title_sub_title_back.dart';
import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:curely/features/welcome/presentation/cubits/selection_cubit.dart';
import 'package:curely/features/welcome/presentation/views/widgets/custom_animated_container.dart';
import 'package:easy_localization/easy_localization.dart';
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
            ),
            child: Column(
              children: [
                TitleSubTitleBack(
                  title: context.tr("choose_language"),
                  subTitle: context.tr("choose_language_subtitle"),
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
                20.verticalSpacing,
                CustomButton(
                  onPressed: () {
                    final localeCubit = context.read<LanguageCubit>();
                    final String finalLanguageCode = context
                        .read<SelectionCubit>()
                        .state;
                    localeCubit.changeLanguage(context, finalLanguageCode);
                    GoRouter.of(context).pop();
                  },
                  backgroundColor: Theme.of(context).colorScheme.onSurface,
                  child: Text(
                    context.tr("confirm"),
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
