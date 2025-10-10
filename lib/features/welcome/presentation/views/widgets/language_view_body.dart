import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:curely/core/utils/cache_helper.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/features/welcome/presentation/views/widgets/custom_animated_container.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class LanguageViewBody extends StatefulWidget {
  const LanguageViewBody({super.key});

  @override
  State<LanguageViewBody> createState() => _LanguageViewBodyState();
}

class _LanguageViewBodyState extends State<LanguageViewBody> {
  bool isArabic = Intl.getCurrentLocale() == kArabic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: kNavyColor,
                size: 33,
              ),
            ),
            SizedBox(height: 30),
            Text(S.of(context).chooseLanguage, style: Styles.styleBlue25),
            Text(S.of(context).chooseLanguageSubTitle, style: Styles.style18),
            Spacer(),
            CustomAnimatedContainer(
              languageName: S.of(context).english,
              languageFlag: AssetsData.kUK,
              onTab: isArabic
                  ? () {
                      isArabic = false;
                      setState(() {});
                    }
                  : null,
              boxShadow: isArabic
                  ? null
                  : [
                      BoxShadow(
                        color: kNavyColor.withAlpha(130),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(10, 10),
                      ),
                    ],
              backgroundColor: isArabic ? kLightGrayColor : kNavyColor,
              style: isArabic ? Styles.styleBlue25 : Styles.styleWhite25,
            ),
            Spacer(),
            CustomAnimatedContainer(
              languageName: S.of(context).arabic,
              languageFlag: AssetsData.kEgypt,
              onTab: isArabic
                  ? null
                  : () {
                      isArabic = true;
                      setState(() {});
                    },
              boxShadow: isArabic
                  ? [
                      BoxShadow(
                        color: kNavyColor.withAlpha(130),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(10, 10),
                      ),
                    ]
                  : null,
              backgroundColor: isArabic ? kNavyColor : kLightGrayColor,
              style: isArabic ? Styles.styleWhite25 : Styles.styleBlue25,
            ),
            Spacer(),
            SizedBox(height: 40),
            Center(
              child: CustomButton(
                onPressed: () {
                  S.load(Locale(isArabic ? kArabic : kEnglish));
                  CacheHelper.putBoolData(key: kIsArabic, value: isArabic);
                  setState(() {});
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRouter.kOnBoardingView);
                },
                backgroundColor: kDarkBlueColor,
                child: Text(S.of(context).confirm, style: Styles.style20),
              ),
            ),
            SizedBox(height: kBottomPadding - 12),
          ],
        ),
      ),
    );
  }
}
