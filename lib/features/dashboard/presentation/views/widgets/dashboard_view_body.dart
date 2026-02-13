import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/core/widgets/custom_square_nav_bar.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingConstants.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.verticalSpacing,
          const Row(
            children: [
              Text(" Dashboard", style: Styles.style33),
              Spacer(),
              Icon(
                FontAwesomeIcons.fileMedical,
                size: 28,
                color: AppColors.primary,
              ),
            ],
          ),
          8.verticalSpacing,
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                8.verticalSpacing,
                Text(" Display Record", style: Styles.styleBlue25),
                CustomNavBar(
                  text: "Display Medicines",
                  prefixIcon: FontAwesomeIcons.pills,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRoutesConstants.kDisplayMedicineView);
                  },
                ),
                CustomNavBar(
                  text: "Display Prescriptions",
                  prefixIcon: FontAwesomeIcons.fileMedical,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRoutesConstants.kDisplayPrescriptionView);
                  },
                ),
                CustomNavBar(
                  text: "Display Rays",
                  prefixIcon: FontAwesomeIcons.xRay,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRoutesConstants.kDisplayRaysView);
                  },
                ),
                CustomNavBar(
                  text: "Display Analysis",
                  prefixIcon: FontAwesomeIcons.flaskVial,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).push(AppRoutesConstants.kDisplayAnalysisView);
                  },
                ),
                16.verticalSpacing,
                Text(" Add Record", style: Styles.styleBlue25),
                Row(
                  children: [
                    CustomSquareNavBar(
                      onTab: () {
                        GoRouter.of(
                          context,
                        ).push(AppRoutesConstants.kAddMedicineView);
                      },
                      text: "Add Medicines",
                    ),
                    CustomSquareNavBar(
                      onTab: () {
                        GoRouter.of(
                          context,
                        ).push(AppRoutesConstants.kAddPrescriptionView);
                      },
                      text: "Add Prescriptions",
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomSquareNavBar(
                      onTab: () {
                        GoRouter.of(
                          context,
                        ).push(AppRoutesConstants.kAddRaysView);
                      },
                      text: "Add Rays",
                    ),
                    CustomSquareNavBar(
                      onTab: () {
                        GoRouter.of(
                          context,
                        ).push(AppRoutesConstants.kAddAnalysisView);
                      },
                      text: "Add Analysis",
                    ),
                  ],
                ),
                16.verticalSpacing,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
