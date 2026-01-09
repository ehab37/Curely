import 'package:curely/constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_medicine_cubit/get_delete_medicines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/display_medicines_view_body.dart';

class DisplayMedicinesView extends StatelessWidget {
  const DisplayMedicinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomAppBar(title: "Display Medicines"),
              ),
              BlocProvider(
                create: (context) => GetDeleteMedicinesCubit(
                  medicineRepo: getIt<MedicineRepo>(),
                  medicineNotificationRepo: getIt<MedicineNotificationRepo>(),
                ),
                child: DisplayMedicinesViewBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
