import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/dashboard/entities/medicine_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisplayedMedicineItem extends StatelessWidget {
  const DisplayedMedicineItem({super.key, required this.medicineItem});

  final MedicineEntity medicineItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(kBorderRadius),
        side: BorderSide(color: kNavyColor),
      ),
      color: Colors.white,
      elevation: 8,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Icon(
                  Icons.access_alarms_outlined,
                  size: 25,
                  color: medicineItem.isReminderActive
                      ? kNavyColor
                      : kGrayColor,
                ),
              ),
            ],
          ),
          Icon(FontAwesomeIcons.pills, size: 50, color: kNavyColor),
          Spacer(),
          Text(medicineItem.medicineName, style: Styles.styleBlue20),
          SizedBox(height: 4),
          Text(medicineItem.medicineTypes, style: Styles.style16),
          SizedBox(height: 4),
          Text(medicineItem.medicineUsage, style: Styles.style16),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
