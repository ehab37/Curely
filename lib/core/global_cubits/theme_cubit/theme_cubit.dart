import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  void _loadTheme() {
    final theme = CacheHelper.getData(key: AppTextConstants.kThemeKey);
    if (theme != null) {
      if (theme == 'dark') {
        emit(ThemeMode.dark);
      } else {
        emit(ThemeMode.light);
      }
    } else {
      emit(ThemeMode.light);
    }
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      CacheHelper.saveData(key: AppTextConstants.kThemeKey, value: 'dark');
    } else {
      emit(ThemeMode.light);
      CacheHelper.saveData(key: AppTextConstants.kThemeKey, value: 'light');
    }
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
