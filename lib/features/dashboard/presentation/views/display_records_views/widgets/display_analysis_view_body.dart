import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayAnalysisViewBody extends StatelessWidget {
  const DisplayAnalysisViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return DisplayedItem(
          file: analysisItems[index].image,
          text1: analysisItems[index].doctorName,
          text2: analysisItems[index].analysisType,
          text3: DateFormat(
            "dd/MM/yyyy",
          ).format(analysisItems[index].examinationDate),
        );
      },
      displayedList: analysisItems,
    );
  }
}
