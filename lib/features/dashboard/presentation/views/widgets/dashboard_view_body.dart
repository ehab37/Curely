import 'package:curely/constants.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/core/widgets/custom_square_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          const Row(
            children: [
              CustomBackBar(),
              Text(" Dashboard", style: Styles.style33),
              Spacer(),
              Icon(FontAwesomeIcons.fileMedical, size: 28, color: kNavyColor),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 8),
                Text(" Display Record", style: Styles.styleBlue25),
                CustomNavBar(
                  text: "Display Medicines",
                  prefixIcon: FontAwesomeIcons.pills,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kDisplayMedicineView);
                  },
                ),
                CustomNavBar(
                  text: "Display Rays",
                  prefixIcon: FontAwesomeIcons.xRay,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    // GoRouter.of(context).push(AppRouter.displayRays);
                  },
                ),
                CustomNavBar(
                  text: "Display Prescriptions",
                  prefixIcon: FontAwesomeIcons.fileMedical,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    // GoRouter.of(context).push(AppRouter.displayPrescription);
                  },
                ),
                CustomNavBar(
                  text: "Display Analysis",
                  prefixIcon: FontAwesomeIcons.flaskVial,
                  suffixIcon: Icons.arrow_forward_ios,
                  onPressed: () {
                    // GoRouter.of(context).push(AppRouter.displayAnalysis);
                  },
                ),
                SizedBox(height: 16),
                Text(" Add Record", style: Styles.styleBlue25),
                Row(
                  children: [
                    CustomSquareNavBar(
                      onTab: () {
                        GoRouter.of(context).push(AppRouter.kAddMedicineView);
                      },
                      text: "Add Medicines",
                    ),
                    CustomSquareNavBar(
                      onTab: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kAddPrescriptionView);
                      },
                      text: "Add Prescriptions",
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomSquareNavBar(onTab: () {}, text: "Add Rays"),
                    CustomSquareNavBar(onTab: () {}, text: "Add Analysis"),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
