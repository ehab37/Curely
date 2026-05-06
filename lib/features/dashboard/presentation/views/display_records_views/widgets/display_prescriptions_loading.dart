import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayPrescriptionsLoading extends StatelessWidget {
  const DisplayPrescriptionsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSkeletonizer(
      child: DisplayedListView(
        itemBuilder: (context, index) {
          return DisplayedItem(
            imageUrl: getDummyPrescriptions()[index].imageUrls![0],
            text1: getDummyPrescriptions()[index].doctorName,
            text2: getDummyPrescriptions()[index].doctorSpecialization,
            text3: getDummyPrescriptions()[index].examinationDate,
          );
        },
        displayedList: getDummyPrescriptions(),
      ),
    );
  }
}
