import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/welcome/presentation/cubits/selection_cubit.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.isArabicLanguage,
    required this.isArabicContainer,
  });

  final bool isArabicLanguage;
  final bool isArabicContainer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SelectionCubit>().selectLanguage(
          isArabicContainer
              ? AppTextConstants.kArabic
              : AppTextConstants.kEnglish,
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          boxShadow: [
            if ((isArabicContainer && isArabicLanguage) ||
                (!isArabicContainer && !isArabicLanguage))
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(10, 10),
              ),
          ],
          color:
              ((isArabicContainer && isArabicLanguage) ||
                  (!isArabicContainer && !isArabicLanguage))
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(25),
        ),
        width: MediaQuery.of(context).size.width / 2,
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              12.verticalSpacing,
              Image.asset(
                isArabicContainer
                    ? AssetsConstants.kEgypt
                    : AssetsConstants.kUK,
                height: 70,
              ),
              Text(
                isArabicContainer
                    ? S.of(context).arabic
                    : S.of(context).english,
                style:
                    ((isArabicContainer && isArabicLanguage) ||
                        (!isArabicContainer && !isArabicLanguage))
                    ? Theme.of(context).textTheme.headlineMedium!
                    : Theme.of(context).textTheme.titleMedium!,
              ),
              12.verticalSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
