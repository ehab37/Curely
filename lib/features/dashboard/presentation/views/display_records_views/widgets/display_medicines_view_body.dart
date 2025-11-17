import 'package:curely/features/dashboard/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/displayed_list_view.dart';
import 'package:flutter/material.dart';
import 'displayed_medicine_item.dart';

class DisplayMedicinesViewBody extends StatelessWidget {
  const DisplayMedicinesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return DisplayedMedicineItem(displayedItem: medicineItems[index]);
      },
      displayedList: medicineItems,
    );
  }
}
