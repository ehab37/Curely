import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_square_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRecordsSection extends StatelessWidget {
  const AddRecordsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" Add Record", style: Theme.of(context).textTheme.titleSmall),
        8.verticalSpacing,
        Row(
          children: [
            CustomSquareNavBar(
              onTab: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddMedicineView);
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
                GoRouter.of(context).push(AppRoutesConstants.kAddRaysView);
              },
              text: "Add Rays",
            ),
            CustomSquareNavBar(
              onTab: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddAnalysisView);
              },
              text: "Add Analysis",
            ),
          ],
        ),
      ],
    );
  }
}
