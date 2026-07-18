import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_prescriptions_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayPrescriptionsView extends StatelessWidget {
  const DisplayPrescriptionsView({super.key, this.isFavoriteView = false});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: isFavoriteView
            ? context.tr("favorite_prescriptions")
            : context.tr("prescription"),
        isBackable: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: BlocProvider(
            create: (context) => ManagePrescriptionsCubit(
              prescriptionRepo: getIt<PrescriptionRepo>(),
              prescriptionNotificationRepo:
                  getIt<PrescriptionNotificationRepo>(),
              imagesRepo: getIt<ImagesRepo>(),
            )..getPrescriptions(isFavoriteView: isFavoriteView),
            child: DisplayPrescriptionsViewBody(isFavoriteView: isFavoriteView),
          ),
        ),
      ),
    );
  }
}
