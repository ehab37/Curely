import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayRaysLoading extends StatelessWidget {
  const DisplayRaysLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSkeletonizer(
      child: DisplayedListView(
        itemBuilder: (context, index) {
          return DisplayedItem(
            imageUrl: getDummyRays()[index].imageUrls![0],
            text1: getDummyRays()[index].doctorName,
            text2: getDummyRays()[index].raysType,
            text3: getDummyRays()[index].examinationDate,
          );
        },
        displayedList: getDummyRays(),
      ),
    );
  }
}
