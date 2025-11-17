import 'package:curely/features/dashboard/entities/rays_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayRaysViewBody extends StatelessWidget {
  const DisplayRaysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return DisplayedItem(
          file: raysItems[index].image,
          text1: raysItems[index].doctorName,
          text2: raysItems[index].raysType,
          text3: DateFormat(
            "dd/MM/yyyy",
          ).format(raysItems[index].examinationDate),
        );
      },
      displayedList: raysItems,
    );
  }
}
