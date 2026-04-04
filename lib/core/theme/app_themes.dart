import 'package:curely/core/constants/spacing_constants.dart';
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
      onSecondaryContainer: AppColors.skyBlue,
      primaryContainer: AppColors.darkGray,
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
      displaySmall: Styles.styleUnderline16,
    ).apply(fontSizeFactor: 1),
    iconTheme: const IconThemeData(color: AppColors.primary),
    listTileTheme: ListTileThemeData(iconColor: AppColors.primary),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
      ),
      titleTextStyle: Styles.styleBlue20,
      contentTextStyle: Styles.style16.copyWith(
        color: AppColors.navy.withAlpha(200),
      ),
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 8),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.background,
      hourMinuteColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return AppColors.lightGray;
      }),
      hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.background;
        return AppColors.primary;
      }),
      dialBackgroundColor: AppColors.lightGray,
      dialHandColor: AppColors.primary,
      dialTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.background;
        return AppColors.primary;
      }),
      entryModeIconColor: AppColors.primary,
      dayPeriodColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return AppColors.background;
      }),
      dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.background;
        }
        return AppColors.primary;
      }),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius / 2),
        side: const BorderSide(color: AppColors.primary),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.background,
      headerBackgroundColor: AppColors.primary,
      headerForegroundColor: AppColors.background,
      headerHeadlineStyle: Styles.styleWhite20,
      dayStyle: Styles.style16,
      // Color of the numbers
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.white;
        if (states.contains(WidgetState.disabled)) return AppColors.unActive;
        return AppColors.navy;
      }),
      // The circle around the selected day
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primary;
        return Colors.transparent;
      }),
      cancelButtonStyle: TextButton.styleFrom(foregroundColor: AppColors.navy),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
      ),
    ),
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
      onSecondaryContainer: AppColors.stone,
      primaryContainer: AppColors.lightGray,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: Styles.styleWhite25,
      backgroundColor: AppColors.backgroundDark,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
    ),
    textTheme: TextTheme(
      displayLarge: Styles.style18.copyWith(color: AppColors.darkBlue),
      bodyMedium: Styles.style16.copyWith(color: AppColors.textSecondary),
      bodySmall: Styles.style15.copyWith(color: AppColors.textSecondary),
      titleLarge: Styles.style28.copyWith(color: AppColors.textSecondary),
      titleMedium: Styles.styleWhite25,
      titleSmall: Styles.styleWhite20,
      headlineMedium: Styles.styleBlue25.copyWith(color: AppColors.darkBlue),
      headlineSmall: Styles.styleBlue20,
      headlineLarge: Styles.style45.copyWith(color: AppColors.textSecondary),
      displaySmall: Styles.styleUnderline16.copyWith(
        color: AppColors.secondaryDark,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryDark),
    listTileTheme: ListTileThemeData(iconColor: AppColors.primaryDark),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.backgroundDark),
    cardTheme: CardThemeData(color: AppColors.stone),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundDark,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
      ),
      titleTextStyle: Styles.styleWhite20,
      contentTextStyle: Styles.style16.copyWith(color: AppColors.lightGray),
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 8),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.backgroundDark,
      hourMinuteColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primaryDark;
        return AppColors.stone;
      }),
      hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.backgroundDark;
        }
        return AppColors.primaryDark;
      }),
      dialBackgroundColor: AppColors.stone,
      dialHandColor: AppColors.primaryDark,
      dialTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.backgroundDark;
        }
        return AppColors.primaryDark;
      }),
      entryModeIconColor: AppColors.primaryDark,
      dayPeriodColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primaryDark;
        return AppColors.backgroundDark;
      }),
      dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.backgroundDark;
        }
        return AppColors.primaryDark;
      }),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius / 2),
        side: const BorderSide(color: AppColors.primaryDark),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.darkBlue,
      headerBackgroundColor: AppColors.primaryDark,
      headerForegroundColor: AppColors.backgroundDark,
      headerHeadlineStyle: Styles.styleWhite20.copyWith(
        color: AppColors.backgroundDark,
      ),
      dayStyle: Styles.style16,
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.backgroundDark;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.stone;
        }
        return AppColors.white;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primaryDark;
        return Colors.transparent;
      }),
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.lightGray,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.primaryDark,
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.fade,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
  );
}
