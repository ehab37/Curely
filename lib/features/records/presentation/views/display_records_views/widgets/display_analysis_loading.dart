import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayAnalysisLoading extends StatelessWidget {
  const DisplayAnalysisLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSkeletonizer(
      child: DisplayedListView(
        itemBuilder: (context, index) {
          return DisplayedItem(
            imageUrl: getDummyAnalysis()[index].imageUrls![0],
            text1: getDummyAnalysis()[index].doctorName,
            text2: getDummyAnalysis()[index].analysisType,
            text3: getDummyAnalysis()[index].examinationDate,
          );
        },
        displayedList: getDummyAnalysis(),
      ),
    );
  }
}
