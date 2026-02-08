import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helper_functions/show_stop_reminder_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisplayedMedicineItem extends StatelessWidget {
  const DisplayedMedicineItem({super.key, required this.medicineItem});

  final MedicineEntity medicineItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(
          SpacingConstants.borderRadius,
        ),
        side: BorderSide(color: AppColors.borderMedium),
      ),
      color: AppColors.background,
      elevation: 8,
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
              onTap: () => showStopReminderDialog(context, medicineItem),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Icon(
                  Icons.access_alarms_outlined,
                  size: 25,
                  color: medicineItem.isReminderActive
                      ? AppColors.primary
                      : AppColors.unActive,
                ),
              ),
            ),
          ),
          medicineItem.imageUrl == null
              ? Icon(FontAwesomeIcons.pills, size: 50, color: AppColors.primary)
              : Image.network(medicineItem.imageUrl!, width: 60, height: 60),
          Spacer(),
          Text(medicineItem.medicineName, style: Styles.styleBlue20),
          4.verticalSpacing,
          Text(medicineItem.medicineTypes, style: Styles.style16),
          4.verticalSpacing,
          Text(medicineItem.medicineUsage, style: Styles.style16),
          12.verticalSpacing,
        ],
      ),
    );
  }
}
