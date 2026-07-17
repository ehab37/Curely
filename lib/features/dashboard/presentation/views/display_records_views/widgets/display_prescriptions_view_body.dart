import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'display_prescriptions_loading.dart';
import 'display_prescriptions_success.dart';

class DisplayPrescriptionsViewBody extends StatelessWidget {
  const DisplayPrescriptionsViewBody({super.key, this.isFavoriteView = false});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManagePrescriptionsCubit, ManagePrescriptionsState>(
      listener: (context, state) {
        if (state is DeletePrescriptionsFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeletePrescriptionsSuccess) {
          InfoBox.successFloatingBox(
            context,
            context.tr("record_deleted_successfully"),
          );
        }
      },
      builder: (context, state) {
        if (state is GetPrescriptionsSuccess) {
          if (state.prescriptions.isEmpty) {
            return isFavoriteView
                ? CustomEmptyWidget(
                    title: context.tr("no_favorite_prescriptions"),
                  )
                : CustomEmptyWidget(
                    title: context.tr("no_prescriptions_found"),
                    subTitle: context.tr("no_prescriptions_added"),
                  );
          }
          return DisplayPrescriptionsSuccess(
            prescriptionsList: state.prescriptions,
          );
        } else if (state is GetPrescriptionsFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManagePrescriptionsCubit>().getPrescriptions();
            },
          );
        } else {
          return DisplayPrescriptionsLoading();
        }
      },
    );
  }
}
