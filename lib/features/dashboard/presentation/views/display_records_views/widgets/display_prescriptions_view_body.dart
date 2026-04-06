import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/displayed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'displayed_list_view.dart';
import 'records_dismissible_widget.dart';

class DisplayPrescriptionsViewBody extends StatefulWidget {
  const DisplayPrescriptionsViewBody({
    super.key,
    required this.isFavoriteView,
    this.searchText,
  });

  final bool isFavoriteView;
  final String? searchText;

  @override
  State<DisplayPrescriptionsViewBody> createState() =>
      _DisplayPrescriptionsViewBodyState();
}

class _DisplayPrescriptionsViewBodyState
    extends State<DisplayPrescriptionsViewBody> {
  @override
  void initState() {
    if (widget.isFavoriteView) {
      context.read<ManagePrescriptionsCubit>().isFavoriteView = true;
    }
    context.read<ManagePrescriptionsCubit>().getPrescriptions(
      searchText: widget.searchText,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePrescriptionsCubit, ManagePrescriptionsState>(
      builder: (context, state) {
        if (state is GetPrescriptionsSuccess) {
          if (state.prescriptions.isEmpty) {
            return widget.isFavoriteView
                ? CustomEmptyWidget(title: "NO Favorite Prescriptions Yet !...")
                : CustomEmptyWidget(
                    title: "No Prescriptions Found",
                    subTitle: "You haven't added any prescriptions yet!...",
                  );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return RecordsDismissibleWidget(
                recordKey: state.prescriptions[index].docId!,
                onDismissed: (direction) {
                  context.read<ManagePrescriptionsCubit>().deletePrescriptions(
                    docId: state.prescriptions[index].docId!,
                  );
                  InfoBox.successFloatingBox(context, 'Prescription deleted.');
                },
                content: GestureDetector(
                  onTap: () {
                    ManagePrescriptionsCubit cubit = context
                        .read<ManagePrescriptionsCubit>();
                    GoRouter.of(context).push(
                      AppRoutesConstants.kPrescriptionDetailsView,
                      extra: [state.prescriptions[index], cubit],
                    );
                  },
                  child: DisplayedItem(
                    imageUrl: state.prescriptions[index].imageUrls![0],
                    text1: state.prescriptions[index].doctorName,
                    text2: state.prescriptions[index].doctorSpecialization,
                    text3: state.prescriptions[index].examinationDate,
                    isFavorite: state.prescriptions[index].isFavorite,
                    onTap: () {
                      context
                          .read<ManagePrescriptionsCubit>()
                          .updatePrescriptions(
                            prescription: state.prescriptions[index]
                              ..isFavorite =
                                  !state.prescriptions[index].isFavorite,
                          );
                    },
                  ),
                ),
              );
            },
            displayedList: state.prescriptions,
          );
        } else if (state is GetPrescriptionsFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManagePrescriptionsCubit>().getPrescriptions();
            },
          );
        } else {
          if (state is DeletePrescriptionsFailure) {
            InfoBox.errorFloatingBox(context, state.errMessage);
          } else if (state is DeletePrescriptionsSuccess) {
            InfoBox.successFloatingBox(context, "Item deleted successfully.");
          }
          return CustomSkeletonizer(
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
