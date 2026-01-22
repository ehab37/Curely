import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 7),
          Text(
            S.of(context).welcome,
            style: Styles.style28,
          ),
          Text(
            S.of(context).to,
            style: Styles.style28,
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).title,
            style: Styles.style45,
          ),
          const SizedBox(height: 30),
          const SizedBox(
            width: 170,
            height: 170,
            child: ClipRRect(
              child: Image(
                image: AssetImage(AssetsData.kLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          CustomContainer(
            border: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  CustomButton(
                    backgroundColor: kSkyBlueColor,
                    child: Text(
                      S.of(context).login,
                      style: Styles.styleBlue20,
                    ),
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.kLoginView);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    backgroundColor: kSkyBlueColor,
                    child: Text(
                      S.of(context).register,
                      style: Styles.styleBlue20,
                    ),
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.kRegisterView);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
