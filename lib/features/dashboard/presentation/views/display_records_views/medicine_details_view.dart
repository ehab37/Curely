import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/read_medicine_widget.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/update_medicine_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView({super.key, required this.medicine});

  final MedicineEntity medicine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.medicineName),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              final cubit = context.read<ManageMedicinesCubit>();
              showCustomBottomSheet(
                context,
                BlocProvider.value(
                  value: cubit,
                  child: UpdateMedicineDetails(medicine: medicine),
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
                  title: 'Delete Medicine?',
                  content:
                      'Are you sure you want to delete the ${medicine.medicineName} medicine?',
                  onDone: () {
                    context.read<ManageMedicinesCubit>().deleteMedicines(
                      medicine: medicine,
                    );
                    InfoBox.customSnackBar(
                      context,
                      '${medicine.medicineName} medicine deleted.',
                    );
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ManageMedicinesCubit, ManageMedicinesState>(
        listener: (context, state) {
          if (state is GetMedicinesFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeleteMedicinesSuccess) {
            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is ManageMedicinesLoading) {
            return const CustomLoadingIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReadMedicineWidget(medicine: medicine),
          );
        },
      ),
    );
  }
}
