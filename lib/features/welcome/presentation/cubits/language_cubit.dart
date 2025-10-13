import 'package:curely/constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Locale _getInitialLocale() {
  final isArabic = CacheHelper.getData(key: kIsArabic) ?? false;
  return Locale(isArabic ? kArabic : kEnglish);
}

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(_getInitialLocale());

  void changeLanguage(String languageCode) async {
    final newLocale = Locale(languageCode);

    if (newLocale != state) {
      await S.load(newLocale);
      final isArabic = languageCode == kArabic;
      await CacheHelper.putBoolData(key: kIsArabic, value: isArabic);
      emit(newLocale);
    }
  }
}
