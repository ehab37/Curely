import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/update_record_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/read_prescription_widget.dart';

class PrescriptionDetailsView extends StatelessWidget {
  const PrescriptionDetailsView({super.key, required this.prescription});

  final PrescriptionEntity prescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showCustomBottomSheet(
                context,
                UpdateRecordDetails(
                  diagnosis: prescription.diagnosis,
                  onSave: (diagnosis) {
                    context
                        .read<ManagePrescriptionsCubit>()
                        .updatePrescriptions(
                          prescription: prescription..diagnosis = diagnosis,
                        );
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () {
              showAlertDialog(
                context: context,
                content: CustomAlertDialog(
                  dialogContext: context,
                  title: 'Delete Prescription?',
                  content: 'Are you sure you want to delete this prescription?',
                  onDone: () {
                    context
                        .read<ManagePrescriptionsCubit>()
                        .deletePrescriptions(docId: prescription.docId!);
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ManagePrescriptionsCubit, ManagePrescriptionsState>(
        listener: (context, state) {
          if (state is GetPrescriptionsFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeletePrescriptionsSuccess) {
            InfoBox.customSnackBar(context, 'Prescription deleted.');
            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is ManagePrescriptionsLoading) {
            return const CustomLoadingIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReadPrescriptionWidget(prescription: prescription),
          );
        },
      ),
    );
  }
}
