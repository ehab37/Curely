import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MedicineReminderIcon extends StatelessWidget {
  const MedicineReminderIcon({super.key, required this.medicineItem});

  final MedicineEntity medicineItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => medicineItem.isReminderActive
          ? showAlertDialog(
              context: context,
              content: CustomAlertDialog(
                dialogContext: context,
                title: 'Stop Reminder?',
                content:
                    'Are you sure you want to stop the reminder for ${medicineItem.medicineName}?',
                onDone: () {
                  context.read<ManageMedicinesCubit>().updateMedicines(
                    medicine: medicineItem..isReminderActive = false,
                  );
                  InfoBox.customSnackBar(
                    context,
                    'Reminder for ${medicineItem.medicineName} stopped.',
                  );
                  GoRouter.of(context).pop();
                },
              ),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8),
        child: Icon(
          Icons.access_alarms_outlined,
          size: 25,
          color: medicineItem.isReminderActive
              ? AppColors.primary
              : AppColors.unActive,
        ),
      ),
    );
  }
}
