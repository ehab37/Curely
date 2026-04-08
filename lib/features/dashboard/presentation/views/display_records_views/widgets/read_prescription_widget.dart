import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
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
                      child: CustomCachedImage(
                        height: 150,
                        url: prescription.imageUrls![0],
                      ),
                    ),
                  ),
                )
              : CustomListView(list: prescription.imageUrls!),
          24.verticalSpacing,
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.userDoctor),
              title: Text(context.tr('doctor_name')),
              subtitle: Text(prescription.doctorName),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.stethoscope),
              title: Text(context.tr('doctor_specialization')),
              subtitle: Text(context.tr(prescription.doctorSpecialization)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.hospital),
              title: Text(context.tr('hospital_name')),
              subtitle: Text(prescription.hospital ?? context.tr('not_added')),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.filePrescription),
              title: Text(context.tr('diagnosis')),
              subtitle: Text(
                prescription.diagnosis ?? context.tr('no_diagnosis'),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(context.tr('examination_date')),
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
