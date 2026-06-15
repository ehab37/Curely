import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchSuggestionEntity {
  final String title;
  final FaIconData icon;
  final void Function(BuildContext context) onTap;

  SearchSuggestionEntity({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  static List<SearchSuggestionEntity> getSuggestionsList() {
    return [
      SearchSuggestionEntity(
        title: 'add_medicine',
        icon: FontAwesomeIcons.briefcaseMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddMedicineView);
        },
      ),
      SearchSuggestionEntity(
        title: 'add_prescription',
        icon: FontAwesomeIcons.fileMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddPrescriptionView);
        },
      ),
      SearchSuggestionEntity(
        title: 'add_rays',
        icon: FontAwesomeIcons.xRay,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddRaysView);
        },
      ),
      SearchSuggestionEntity(
        title: 'add_analysis',
        icon: FontAwesomeIcons.handHoldingMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kAddAnalysisView);
        },
      ),
      SearchSuggestionEntity(
        title: 'display_medicines',
        icon: FontAwesomeIcons.capsules,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kDisplayMedicineView);
        },
      ),
      SearchSuggestionEntity(
        title: 'display_prescriptions',
        icon: FontAwesomeIcons.prescription,
        onTap: (context) {
          GoRouter.of(
            context,
          ).push(AppRoutesConstants.kDisplayPrescriptionView);
        },
      ),
      SearchSuggestionEntity(
        title: 'display_rays',
        icon: FontAwesomeIcons.fileWaveform,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kDisplayRaysView);
        },
      ),
      SearchSuggestionEntity(
        title: 'display_analysis',
        icon: FontAwesomeIcons.flaskVial,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kDisplayAnalysisView);
        },
      ),
      SearchSuggestionEntity(
        title: 'favorite_medicines',
        icon: FontAwesomeIcons.heartCirclePlus,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayMedicineView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'favorite_prescriptions',
        icon: FontAwesomeIcons.filePrescription,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayPrescriptionView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'favorite_rays',
        icon: FontAwesomeIcons.heartPulse,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayRaysView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'favorite_analysis',
        icon: FontAwesomeIcons.handHoldingDroplet,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayAnalysisView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'reminders',
        icon: FontAwesomeIcons.userClock,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kDisplayMedicineView,
            extra: {'isReminderView': true, 'isFavoriteView': false},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'health_notes',
        icon: FontAwesomeIcons.notesMedical,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kNotesView);
        },
      ),
      SearchSuggestionEntity(
        title: 'favorite_health_notes',
        icon: FontAwesomeIcons.solidBookmark,
        onTap: (context) {
          GoRouter.of(context).push(
            AppRoutesConstants.kNotesView,
            extra: {'isReminderView': false, 'isFavoriteView': true},
          );
        },
      ),
      SearchSuggestionEntity(
        title: 'language',
        icon: FontAwesomeIcons.language,
        onTap: (context) {
          GoRouter.of(context).push(AppRoutesConstants.kLanguageView);
        },
      ),
    ];
  }
}
