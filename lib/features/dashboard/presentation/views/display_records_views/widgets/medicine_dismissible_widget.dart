import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'displayed_medicine_item.dart';

class MedicineDismissibleWidget extends StatelessWidget {
  const MedicineDismissibleWidget({super.key, required this.medicine});

  final MedicineEntity medicine;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(medicine.docId!),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(
            SpacingConstants.borderRadius,
          ),
          color: AppColors.error,
        ),
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsetsDirectional.only(start: 20.0),
        child: const Icon(Icons.delete, color: AppColors.background),
      ),
      direction: DismissDirection.startToEnd,
      confirmDismiss: (DismissDirection direction) async {
        return await showAlertDialog(
          context: context,
          content: CustomAlertDialog(
            dialogContext: context,
            title: context.tr('delete_medicine_title'),
            content: context.tr('delete_medicine_content'),
            onDone: () {
              GoRouter.of(context).pop(true);
            },
          ),
        );
      },
      onDismissed: (direction) {
        context.read<ManageMedicinesCubit>().deleteMedicines(
          medicine: medicine,
        );
      },
      child: DisplayedMedicineItem(medicineItem: medicine),
    );
  }
}
