import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNavBar(
          text: 'Medicines',
          prefixIcon: FontAwesomeIcons.pills,
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutesConstants.kDisplayMedicineView,
              extra: {'isReminderView': false, 'isFavoriteView': true},
            );
          },
          suffixIcon: Icons.arrow_forward_ios_rounded,
        ),
        CustomNavBar(
          text: 'Prescription',
          prefixIcon: FontAwesomeIcons.fileMedical,
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutesConstants.kDisplayPrescriptionView,
              extra: {'isReminderView': false, 'isFavoriteView': true},
            );
          },
          suffixIcon: Icons.arrow_forward_ios_rounded,
        ),
        CustomNavBar(
          text: 'Rays',
          prefixIcon: FontAwesomeIcons.xRay,
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutesConstants.kDisplayRaysView,
              extra: {'isReminderView': false, 'isFavoriteView': true},
            );
          },
          suffixIcon: Icons.arrow_forward_ios_rounded,
        ),
        CustomNavBar(
          text: 'Analysis',
          prefixIcon: FontAwesomeIcons.flaskVial,
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutesConstants.kDisplayAnalysisView,
              extra: {'isReminderView': false, 'isFavoriteView': true},
            );
          },
          suffixIcon: Icons.arrow_forward_ios_rounded,
        ),
      ],
    );
  }
}
