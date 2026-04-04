import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DisplayRecordsSection extends StatelessWidget {
  const DisplayRecordsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" Display Record", style: Theme.of(context).textTheme.titleSmall),
        8.verticalSpacing,
        CustomNavBar(
          text: "Display Medicines",
          prefixIcon: FontAwesomeIcons.pills,
          suffixIcon: Icons.arrow_forward_ios,
          onPressed: () {
            GoRouter.of(context).push(AppRoutesConstants.kDisplayMedicineView);
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
            GoRouter.of(context).push(AppRoutesConstants.kDisplayRaysView);
          },
        ),
        CustomNavBar(
          text: "Display Analysis",
          prefixIcon: FontAwesomeIcons.flaskVial,
          suffixIcon: Icons.arrow_forward_ios,
          onPressed: () {
            GoRouter.of(context).push(AppRoutesConstants.kDisplayAnalysisView);
          },
        ),
      ],
    );
  }
}
