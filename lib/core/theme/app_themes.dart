import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.navy,
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.background,
      secondary: AppColors.skyBlue,
      onSecondary: AppColors.navy.withAlpha(160),
      surface: AppColors.white,
      onSurface: AppColors.darkBlue,
      surfaceContainerHighest: AppColors.lightGray,
      surfaceContainerHigh: AppColors.darkGray.withAlpha(160),
      shadow: AppColors.navy.withAlpha(160),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.primary),
      titleTextStyle: Styles.styleBlue25,
    ),
    textTheme: TextTheme(
      displayLarge: Styles.style18,
      bodyMedium: Styles.style16,
      bodySmall: Styles.style15,
      titleLarge: Styles.style28,
      titleMedium: Styles.styleBlue25,
      titleSmall: Styles.styleBlue20,
      headlineMedium: Styles.styleWhite25,
      headlineSmall: Styles.styleWhite20,
      headlineLarge: Styles.style45,
    ).apply(fontSizeFactor: 1),
    iconTheme: const IconThemeData(color: AppColors.primary),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.fade,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.skyBlue,
    scaffoldBackgroundColor: AppColors.darkBlue,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.skyBlue,
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.backgroundDark,
      secondary: AppColors.darkBlue,
      onSecondary: AppColors.lightGray,
      surface: AppColors.darkGray,
      onSurface: AppColors.white,
      surfaceContainerHighest: AppColors.stone,
      surfaceContainerHigh: AppColors.lightGray,
      shadow: AppColors.skyBlue.withAlpha(160),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: Styles.styleWhite25,
      backgroundColor: AppColors.backgroundDark,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
    ),
    textTheme: TextTheme(
      displayLarge: Styles.style18.copyWith(color: AppColors.textPrimary),
      bodyMedium: Styles.style16.copyWith(color: AppColors.textSecondary),
      bodySmall: Styles.style15.copyWith(color: AppColors.textSecondary),
      titleLarge: Styles.style28.copyWith(color: AppColors.textSecondary),
      titleMedium: Styles.styleWhite25,
      titleSmall: Styles.styleWhite20,
      headlineMedium: Styles.styleBlue25,
      headlineSmall: Styles.styleBlue20,
      headlineLarge: Styles.style45.copyWith(color: AppColors.textSecondary),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryDark),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.fade,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
  );
}
