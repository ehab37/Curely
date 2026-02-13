import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/helpers/extensions.dart';
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
          Text(S.of(context).welcome, style: Styles.style28),
          Text(S.of(context).to, style: Styles.style28),
          10.verticalSpacing,
          Text(S.of(context).title, style: Styles.style45),
          30.verticalSpacing,
          const SizedBox(
            width: 170,
            height: 170,
            child: ClipRRect(
              child: Image(
                image: AssetImage(AssetsConstants.kLogo),
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
              padding: const EdgeInsets.symmetric(
                horizontal: SpacingConstants.horizontalPadding,
              ),
              child: Column(
                children: [
                  80.verticalSpacing,
                  CustomButton(
                    backgroundColor: AppColors.skyBlue,
                    child: Text(S.of(context).login, style: Styles.styleBlue20),
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRoutesConstants.kLoginView);
                    },
                  ),
                  25.verticalSpacing,
                  CustomButton(
                    backgroundColor: AppColors.skyBlue,
                    child: Text(
                      S.of(context).register,
                      style: Styles.styleBlue20,
                    ),
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRoutesConstants.kRegisterView);
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
