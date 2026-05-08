import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

class AppThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
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
      onPrimaryContainer: AppColors.skyBlue.withAlpha(51),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.primary),
      titleTextStyle: Styles.styleBlue25(context),
    ),
    textTheme: TextTheme(
      displayLarge: Styles.style18(context),
      bodyMedium: Styles.style16(context),
      bodySmall: Styles.style15(context),
      titleLarge: Styles.style28(context),
      titleMedium: Styles.styleBlue25(context),
      titleSmall: Styles.styleBlue20(context),
      headlineMedium: Styles.styleWhite25(context),
      headlineSmall: Styles.styleWhite20(context),
      headlineLarge: Styles.style45(context),
      displaySmall: Styles.styleUnderline16(context),
    ).apply(fontSizeFactor: 1),
    iconTheme: const IconThemeData(color: AppColors.primary),
    listTileTheme: const ListTileThemeData(iconColor: AppColors.primary),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
      ),
      titleTextStyle: Styles.styleBlue20(context),
      contentTextStyle: Styles.style16(
        context,
      ).copyWith(color: AppColors.navy.withAlpha(200)),
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
      headerHeadlineStyle: Styles.styleWhite20(context),
      dayStyle: Styles.style16(context),
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
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.fade,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
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
      onPrimaryContainer: AppColors.stone,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: Styles.styleWhite25(context),
      backgroundColor: AppColors.backgroundDark,
      iconTheme: const IconThemeData(color: AppColors.primaryDark),
    ),
    textTheme: TextTheme(
      displayLarge: Styles.style18(context).copyWith(color: AppColors.darkBlue),
      bodyMedium: Styles.style16(
        context,
      ).copyWith(color: AppColors.textSecondary),
      bodySmall: Styles.style15(
        context,
      ).copyWith(color: AppColors.textSecondary),
      titleLarge: Styles.style28(
        context,
      ).copyWith(color: AppColors.textSecondary),
      titleMedium: Styles.styleWhite25(context),
      titleSmall: Styles.styleWhite20(context),
      headlineMedium: Styles.styleBlue25(
        context,
      ).copyWith(color: AppColors.darkBlue),
      headlineSmall: Styles.styleBlue20(context),
      headlineLarge: Styles.style45(
        context,
      ).copyWith(color: AppColors.textSecondary),
      displaySmall: Styles.styleUnderline16(
        context,
      ).copyWith(color: AppColors.secondaryDark),
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryDark),
    listTileTheme: const ListTileThemeData(iconColor: AppColors.primaryDark),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.backgroundDark,
    ),
    cardTheme: const CardThemeData(color: AppColors.stone),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.backgroundDark,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
      ),
      titleTextStyle: Styles.styleWhite20(context),
      contentTextStyle: Styles.style16(
        context,
      ).copyWith(color: AppColors.lightGray),
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
      headerHeadlineStyle: Styles.styleWhite20(
        context,
      ).copyWith(color: AppColors.backgroundDark),
      dayStyle: Styles.style16(context),
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
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.fade,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
  );
}
