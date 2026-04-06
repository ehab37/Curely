import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'font_weight_helper.dart';

abstract class Styles {
  static const TextStyle style45 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 45,
    fontWeight: FontWeightHelper.thick,
    letterSpacing: 1.5,
    height: .8,
  );
  static const TextStyle style28 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 28,
    fontWeight: FontWeightHelper.bold,
  );
  static const TextStyle styleBlue25 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 25,
    fontWeight: FontWeightHelper.bold,
  );
  static const TextStyle styleWhite25 = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 25,
    fontWeight: FontWeightHelper.bold,
  );

  static const TextStyle styleWhite20 = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 20,
    fontWeight: FontWeightHelper.bold,
    wordSpacing: .1,
    height: 0,
  );
  static const TextStyle styleBlue20 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeightHelper.bold,
    wordSpacing: .1,
    height: 0,
  );

  static const TextStyle style18 = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 18,
    fontWeight: FontWeightHelper.regular,
    wordSpacing: .1,
    height: 0,
  );

  static const TextStyle style16 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
  );
  static const TextStyle styleUnderline16 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
    decoration: TextDecoration.underline,
  );

  static const TextStyle style15 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15,
    wordSpacing: .1,
    height: 0,
    fontWeight: FontWeightHelper.regular,
  );
}
