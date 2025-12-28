import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/get_dummy_data.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_prescriptions_cubit/get_delete_prescriptions_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/displayed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'displayed_list_view.dart';

class DisplayPrescriptionsViewBody extends StatefulWidget {
  const DisplayPrescriptionsViewBody({super.key});

  @override
  State<DisplayPrescriptionsViewBody> createState() =>
      _DisplayPrescriptionsViewBodyState();
}

class _DisplayPrescriptionsViewBodyState
    extends State<DisplayPrescriptionsViewBody> {
  @override
  void initState() {
    context.read<GetDeletePrescriptionsCubit>().getPrescriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetDeletePrescriptionsCubit,
      GetDeletePrescriptionsState
    >(
      builder: (context, state) {
        if (state is GetPrescriptionsSuccess) {
          if (state.prescriptions.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "NO Prescriptions added yet!...",
                  style: Styles.styleBlue25,
                ),
              ),
            );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(state.prescriptions[index].docId!),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(kBorderRadius),
                    color: kErrorColor,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) => context
                    .read<GetDeletePrescriptionsCubit>()
                    .deletePrescriptions(
                      docId: state.prescriptions[index].docId!,
                    ),
                child: DisplayedItem(
                  imageUrl: state.prescriptions[index].imageUrl!,
                  text1: state.prescriptions[index].doctorName,
                  text2: state.prescriptions[index].doctorSpecialization,
                  text3: state.prescriptions[index].examinationDate,
                ),
              );
            },
            displayedList: state.prescriptions,
          );
        } else if (state is GetPrescriptionsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage, style: Styles.styleBlue25),
            ),
          );
        } else {
          if (state is DeletePrescriptionsFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeletePrescriptionsSuccess) {
            InfoBox.customSnackBar(context, "Item deleted successfully.");
          }
          return Skeletonizer.sliver(
            child: DisplayedListView(
              itemBuilder: (context, index) {
                return DisplayedItem(
                  text1: getDummyPrescriptions()[index].doctorName,
                  text2: getDummyPrescriptions()[index].doctorSpecialization,
                  text3: getDummyPrescriptions()[index].examinationDate,
                );
              },
              displayedList: getDummyPrescriptions(),
            ),
          );
        }
      },
    );
  }
}
