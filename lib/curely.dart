import 'package:easy_localization/easy_localization.dart' as lz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_transitions/go_transitions.dart';
import 'core/constants/app_text_constants.dart';
import 'core/global_cubits/theme_cubit/theme_cubit.dart';
import 'core/theme/app_themes.dart';
import 'core/utils/app_router.dart';
import 'features/welcome/presentation/cubits/language_cubit.dart';

class Curely extends StatelessWidget {
  const Curely({super.key});

  @override
  Widget build(BuildContext context) {
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = const Duration(milliseconds: 400);
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            final TextDirection textDirection =
                context.locale.languageCode == AppTextConstants.kArabic
                ? TextDirection.rtl
                : TextDirection.ltr;
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: themeMode,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              routerConfig: AppRouter.router,
              builder: (context, child) =>
                  Directionality(textDirection: textDirection, child: child!),
            );
          },
        );
      },
    );
  }
}
