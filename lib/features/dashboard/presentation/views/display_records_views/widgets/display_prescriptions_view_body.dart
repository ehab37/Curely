import 'package:curely/features/dashboard/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/displayed_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'displayed_list_view.dart';

class DisplayPrescriptionsViewBody extends StatelessWidget {
  const DisplayPrescriptionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return DisplayedItem(
          file: prescriptionItems[index].image,
          text1: prescriptionItems[index].doctorName,
          text2: prescriptionItems[index].doctorSpecialization,
          text3: DateFormat(
            "dd/MM/yyyy",
          ).format(prescriptionItems[index].examinationDate),
        );
      },
      displayedList: prescriptionItems,
    );
  }
}
