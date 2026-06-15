import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
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
          text: context.tr('medicines'),
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
          text: context.tr('prescription'),
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
          text: context.tr('rays'),
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
          text: context.tr('analysis'),
          prefixIcon: FontAwesomeIcons.flaskVial,
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutesConstants.kDisplayAnalysisView,
              extra: {'isReminderView': false, 'isFavoriteView': true},
            );
          },
          suffixIcon: Icons.arrow_forward_ios_rounded,
        ),
        CustomNavBar(
          text: context.tr('health_notes'),
          prefixIcon: FontAwesomeIcons.solidNoteSticky,
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutesConstants.kNotesView,
              extra: {'isReminderView': false, 'isFavoriteView': true},
            );
          },
          suffixIcon: Icons.arrow_forward_ios_rounded,
        ),
      ],
    );
  }
}
