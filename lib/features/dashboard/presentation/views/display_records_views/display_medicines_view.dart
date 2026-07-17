import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/display_medicines_view_body.dart';

class DisplayMedicinesView extends StatelessWidget {
  const DisplayMedicinesView({
    super.key,
    this.isRemindersView = false,
    this.isFavoriteView = false,
  });

  final bool isRemindersView;
  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: isRemindersView
            ? context.tr("reminders")
            : isFavoriteView
            ? context.tr("favorite_medicines")
            : context.tr("medicines"),
        isBackable: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: BlocProvider(
            create: (context) =>
                ManageMedicinesCubit(
                  medicineRepo: getIt<MedicineRepo>(),
                  medicineNotificationRepo: getIt<MedicineNotificationRepo>(),
                )..getMedicines(
                  isFavoriteView: isFavoriteView,
                  isRemindersView: isRemindersView,
                ),
            child: DisplayMedicinesViewBody(
              isRemindersView: isRemindersView,
              isFavoriteView: isFavoriteView,
            ),
          ),
        ),
      ),
    );
  }
}
