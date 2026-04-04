import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ReadMedicineWidget extends StatelessWidget {
  const ReadMedicineWidget({super.key, required this.medicine});

  final MedicineEntity medicine;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: medicine.imageUrl == null
                ? Icon(FontAwesomeIcons.pills, size: 100)
                : GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRoutesConstants.kImageView,
                        extra: medicine.imageUrl!,
                      );
                    },
                    child: Hero(
                      tag: medicine.imageUrl!,
                      child: CustomCachedImage(
                        height: 150,
                        url: medicine.imageUrl!,
                      ),
                    ),
                  ),
          ),
          24.verticalSpacing,
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.pills),
              title: const Text('Name'),
              subtitle: Text(medicine.medicineName),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.prescriptionBottle),
              title: const Text('Type'),
              subtitle: Text(medicine.medicineTypes),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Usage'),
              subtitle: Text(medicine.medicineUsage),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notes),
              title: const Text('Notes'),
              subtitle: Text(medicine.medicineNotes ?? "No Notes"),
            ),
          ),
          Card(
            child: SwitchListTile(
              title: const Text('Reminder'),
              value: medicine.isReminderActive,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}
