import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'font_weight_helper.dart';

abstract class Styles {
  static TextStyle style45(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 45.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.thick,
    letterSpacing: 1.5,
    height: .8,
  );

  static TextStyle style28(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 28.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle styleBlue25(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 25.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle styleWhite25(BuildContext context) => TextStyle(
    color: AppColors.textSecondary,
    fontSize: 25.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle styleWhite20(BuildContext context) => TextStyle(
    color: AppColors.textSecondary,
    fontSize: 20.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.bold,
    wordSpacing: .1,
    height: 0,
  );

  static TextStyle styleBlue20(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.bold,
    wordSpacing: .1,
    height: 0,
  );

  static TextStyle style18(BuildContext context) => TextStyle(
    color: AppColors.textSecondary,
    fontSize: 18.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.regular,
    wordSpacing: .1,
    height: 0,
  );

  static TextStyle style16(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle styleUnderline16(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16.toResponsiveFontSize(context),
    fontWeight: FontWeightHelper.medium,
    decoration: TextDecoration.underline,
  );

  static TextStyle style15(BuildContext context) => TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15.toResponsiveFontSize(context),
    wordSpacing: .1,
    height: 0,
    fontWeight: FontWeightHelper.regular,
  );
}
