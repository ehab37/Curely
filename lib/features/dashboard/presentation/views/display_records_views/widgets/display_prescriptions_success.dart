import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';
import 'records_dismissible_widget.dart';

class DisplayPrescriptionsSuccess extends StatelessWidget {
  const DisplayPrescriptionsSuccess({
    super.key,
    required this.prescriptionsList,
  });

  final List<PrescriptionEntity> prescriptionsList;

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return RecordsDismissibleWidget(
          recordKey: prescriptionsList[index].docId!,
          onDismissed: (direction) {
            context.read<ManagePrescriptionsCubit>().deletePrescriptions(
              docId: prescriptionsList[index].docId!,
            );
          },
          content: GestureDetector(
            onTap: () {
              ManagePrescriptionsCubit cubit = context
                  .read<ManagePrescriptionsCubit>();
              GoRouter.of(context).push(
                AppRoutesConstants.kPrescriptionDetailsView,
                extra: [prescriptionsList[index], cubit],
              );
            },
            child: DisplayedItem(
              imageUrl: prescriptionsList[index].imageUrls![0],
              text1: prescriptionsList[index].doctorName,
              text2: context.tr(prescriptionsList[index].doctorSpecialization),
              text3: prescriptionsList[index].examinationDate,
              isFavorite: prescriptionsList[index].isFavorite,
              onTap: () {
                context.read<ManagePrescriptionsCubit>().updatePrescriptions(
                  prescription: prescriptionsList[index]
                    ..isFavorite = !prescriptionsList[index].isFavorite,
                );
              },
            ),
          ),
        );
      },
      displayedList: prescriptionsList,
    );
  }
}
