import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_square_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRecordsSection extends StatelessWidget {
  const AddRecordsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("add_record"),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        8.verticalSpacing,
        Row(
          children: [
            CustomSquareNavBar(
              onTab: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddMedicineView);
              },
              text: context.tr("add_medicines"),
            ),
            CustomSquareNavBar(
              onTab: () {
                GoRouter.of(
                  context,
                ).push(AppRoutesConstants.kAddPrescriptionView);
              },
              text: context.tr("add_prescriptions"),
            ),
          ],
        ),
        Row(
          children: [
            CustomSquareNavBar(
              onTab: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddRaysView);
              },
              text: context.tr("add_rays"),
            ),
            CustomSquareNavBar(
              onTab: () {
                GoRouter.of(context).push(AppRoutesConstants.kAddAnalysisView);
              },
              text: context.tr("add_analysis"),
            ),
          ],
        ),
      ],
    );
  }
}
