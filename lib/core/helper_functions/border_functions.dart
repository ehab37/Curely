import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder customBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(SpacingConstants.borderRadius),
    borderSide: BorderSide(color: AppColors.borderMedium),
  );
}
