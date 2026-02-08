import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:flutter/material.dart';

Future<void> showStopReminderDialog(
  BuildContext context,
  MedicineEntity medicineItem,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return CustomAlertDialog(
        dialogContext: dialogContext,
        title: 'Stop Reminder?',
        content:
            'Are you sure you want to stop the reminder for ${medicineItem.medicineName}?',
        onDone: () {
          //ToDo: handling stopping the reminder
          InfoBox.customSnackBar(
            context,
            'Reminder for ${medicineItem.medicineName} stopped.',
          );
          Navigator.of(dialogContext).pop();
        },
      );
    },
  );
}
