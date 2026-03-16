import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchSuggestionEntity {
  final String title;
  final IconData icon;
  final void Function(BuildContext context) onTap;

  SearchSuggestionEntity({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  static List<SearchSuggestionEntity> getSuggestionsList() {
    return [
      SearchSuggestionEntity(
        title: 'Add Medicine',
        icon: Icons.medication_liquid_rounded,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddMedicineView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Add Prescription',
        icon: FontAwesomeIcons.fileMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddPrescriptionView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Add Rays',
        icon: FontAwesomeIcons.xRay,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddRaysView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Add Analysis',
        icon: FontAwesomeIcons.handHoldingMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddAnalysisView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Display Medicines',
        icon: FontAwesomeIcons.capsules,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kDisplayMedicineView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Display Prescriptions',
        icon: FontAwesomeIcons.prescription,
        onTap: (context) {
          GoRouter.of(
            context,
          ).push(AppRoutesConstants.kDisplayPrescriptionView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Display Rays',
        icon: FontAwesomeIcons.fileWaveform,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kDisplayRaysView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Display Analysis',
        icon: FontAwesomeIcons.flaskVial,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kDisplayAnalysisView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Favorite Medicines',
        icon: FontAwesomeIcons.heartCirclePlus,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayMedicineView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'Favorite Prescriptions',
        icon: FontAwesomeIcons.filePrescription,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayPrescriptionView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'Favorite Rays',
        icon: FontAwesomeIcons.heartPulse,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayRaysView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'Favorite Analysis',
        icon: FontAwesomeIcons.handHoldingDroplet,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayAnalysisView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'Reminders',
        icon: FontAwesomeIcons.userClock,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayMedicineView,
            extra: {'isReminderView': true, 'isFavoriteView': false},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'Health Notes',
        icon: FontAwesomeIcons.notesMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kNotesView);
        },
      ),
      SearchSuggestionEntity(
        title: 'Favorite Health Notes',
        icon: Icons.bookmark_border,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kNotesView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'Language',
        icon: FontAwesomeIcons.language,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kLanguageView);
        },
      ),
    ];
  }
}
