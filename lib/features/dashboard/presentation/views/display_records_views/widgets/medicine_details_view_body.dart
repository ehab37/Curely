import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/details_image_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicineDetailsViewBody extends StatelessWidget {
  const MedicineDetailsViewBody({super.key, required this.medicine});

  final MedicineEntity medicine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        medicine.imageUrl == null
            ? FaIcon(FontAwesomeIcons.pills, size: 150)
            : Expanded(child: DetailsImageItem(imageUrl: medicine.imageUrl!)),
        24.verticalSpacing,
        ...medicineDetailsList(context, medicine).map(
          (e) => Card(
            child: ListTile(
              leading: FaIcon(e.icon),
              title: Text(e.title),
              subtitle: Text(e.subTitle),
            ),
          ),
        ),
        Card(
          child: SwitchListTile(
            title: Text(context.tr('reminder')),
            value: medicine.isReminderActive,
            onChanged: null,
          ),
        ),
      ],
    );
  }
}
