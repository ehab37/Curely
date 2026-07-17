import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/displayed_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'displayed_medicine_item.dart';
import 'medicine_dismissible_widget.dart';

class DisplayMedicinesViewBody extends StatelessWidget {
  const DisplayMedicinesViewBody({
    super.key,
    this.isRemindersView = false,
    this.isFavoriteView = false,
  });

  final bool isRemindersView;
  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageMedicinesCubit, ManageMedicinesState>(
      listener: (context, state) {
        if (state is DeleteMedicinesFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeleteMedicinesSuccess) {
          InfoBox.successFloatingBox(
            context,
            context.tr("record_deleted_successfully"),
          );
        }
      },
      builder: (context, state) {
        if (state is GetMedicinesSuccess) {
          if (state.medicines.isEmpty) {
            return isFavoriteView
                ? CustomEmptyWidget(title: context.tr("no_fav_medicines"))
                : isRemindersView
                ? CustomEmptyWidget(title: context.tr("no_reminders"))
                : CustomEmptyWidget(
                    title: context.tr("no_medicines_found"),
                    subTitle: context.tr("no_medicines_added"),
                  );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return MedicineDismissibleWidget(
                medicine: state.medicines[index],
              );
            },
            displayedList: state.medicines,
          );
        } else if (state is GetMedicinesFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManageMedicinesCubit>().getMedicines();
            },
          );
        } else {
          return CustomSkeletonizer(
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
