import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helper_functions/get_dummy_data.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_medicine_cubit/get_delete_medicines_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/displayed_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'displayed_medicine_item.dart';

class DisplayMedicinesViewBody extends StatefulWidget {
  const DisplayMedicinesViewBody({super.key, required this.isRemindersView});

  final bool isRemindersView;

  @override
  State<DisplayMedicinesViewBody> createState() =>
      _DisplayMedicinesViewBodyState();
}

class _DisplayMedicinesViewBodyState extends State<DisplayMedicinesViewBody> {
  @override
  void initState() {
    if (widget.isRemindersView) {
      context.read<GetDeleteMedicinesCubit>().isReminderView = true;
    }
    context.read<GetDeleteMedicinesCubit>().getMedicines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeleteMedicinesCubit, GetDeleteMedicinesState>(
      builder: (context, state) {
        if (state is GetMedicinesSuccess) {
          if (state.medicines.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  widget.isRemindersView
                      ? "NO Reminders added yet!..."
                      : "NO Medicines added yet!...",
                  style: Styles.styleBlue25,
                ),
              ),
            );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(state.medicines[index].docId!),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(
                      SpacingConstants.borderRadius,
                    ),
                    color: AppColors.error,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.delete, color: AppColors.background),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) async {
                  await context.read<GetDeleteMedicinesCubit>().deleteMedicines(
                    medicine: state.medicines[index],
                  );
                },
                child: DisplayedMedicineItem(
                  medicineItem: state.medicines[index],
                ),
              );
            },
            displayedList: state.medicines,
          );
        } else if (state is GetMedicinesFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              error: state.errMessage,
              onTryAgain: () {
                context.read<GetDeleteMedicinesCubit>().getMedicines();
              },
            ),
          );
        } else {
          if (state is DeleteMedicinesFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeleteMedicinesSuccess) {
            InfoBox.customSnackBar(context, "Item deleted successfully.");
          }
          return Skeletonizer.sliver(
            child: DisplayedListView(
              itemBuilder: (context, index) {
                return DisplayedMedicineItem(
                  medicineItem: getDummyMedicines()[index],
                );
              },
              displayedList: getDummyMedicines(),
            ),
          );
        }
      },
    );
  }
}
