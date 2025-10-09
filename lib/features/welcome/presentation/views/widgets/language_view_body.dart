import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:curely/core/utils/cache_helper.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
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
  bool isArabic = Intl.getCurrentLocale() == 'ar';

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
            Text("Choose The Language", style: Styles.styleBlue25),
            Text(
              "Select your preferred language below This helps us serve you better.",
              style: Styles.style18,
            ),
            SizedBox(height: 30),
            // Column(
            //   children: List.generate(
            //     2,
            //         (index) => AnimatedContainer(
            //       duration: const Duration(milliseconds: 300),
            //       margin: const EdgeInsets.symmetric(horizontal: 8.0),
            //       height: 8.0,
            //       width: cubit.screenIndex == index ? 24.0 : 8.0,
            //       decoration: BoxDecoration(
            //         color: cubit.screenIndex == index
            //             ? kBlueColor
            //             : kGrayColor,
            //         borderRadius: BorderRadius.circular(4.0),
            //       ),
            //     ),
            //   ).toList(),
            // ),
            Center(
              child: GestureDetector(
                onTap: isArabic
                    ? () {
                        isArabic = false;
                        setState(() {});
                      }
                    : null,
                child: AnimatedContainer(
                  duration: kTransitionDuration,
                  decoration: BoxDecoration(
                    color: isArabic ? kLightGrayColor : kNavyColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 12),
                      Image.asset(AssetsData.kUK, height: 70),
                      Text(
                        "English",
                        style: isArabic
                            ? Styles.styleBlue25
                            : Styles.styleWhite25,
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: isArabic
                    ? null
                    : () {
                        isArabic = true;
                        setState(() {});
                      },
                child: AnimatedContainer(
                  duration: kTransitionDuration,
                  decoration: BoxDecoration(
                    color: isArabic ? kNavyColor : kLightGrayColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 12),
                      Image.asset(AssetsData.kEgypt, height: 70),
                      Text(
                        "Arabic",
                        style: isArabic
                            ? Styles.styleWhite25
                            : Styles.styleBlue25,
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: CustomButton(
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).pushReplacement(AppRouter.kOnBoardingView);
                  S.load(Locale(isArabic?"ar":"en"));
                  CacheHelper.putBoolData(key: kIsArabic, value: isArabic);
                },
                backgroundColor: kDarkBlueColor,
                child: Text("Confirm", style: Styles.style20),
              ),
            ),
            SizedBox(height: kBottomPadding - 12),
          ],
        ),
      ),
    );
  }
}
