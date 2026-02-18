import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'custom_list_view.dart';

class ReadPrescriptionWidget extends StatelessWidget {
  const ReadPrescriptionWidget({super.key, required this.prescription});

  final PrescriptionEntity prescription;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prescription.imageUrls!.length == 1
              ? Center(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRoutesConstants.kImageView,
                        extra: prescription.imageUrls![0],
                      );
                    },
                    child: Hero(
                      tag: prescription.imageUrls![0],
                      child: Image.network(
                        prescription.imageUrls![0],
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                )
              : CustomListView(list: prescription.imageUrls!),
          24.verticalSpacing,
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.userDoctor),
              title: const Text('Doctor Name'),
              subtitle: Text(prescription.doctorName),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.stethoscope),
              title: const Text('Doctor Specialization'),
              subtitle: Text(prescription.doctorSpecialization),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.hospital),
              title: const Text('Hospital Name'),
              subtitle: Text(prescription.hospital ?? 'Not Added'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.filePrescription),
              title: const Text('Diagnosis'),
              subtitle: Text(prescription.diagnosis ?? 'No Diagnosis'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Examination Date'),
              subtitle: Text(
                DateFormat(
                  "dd/MM/yyyy",
                ).format(DateTime.parse(prescription.examinationDate)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
