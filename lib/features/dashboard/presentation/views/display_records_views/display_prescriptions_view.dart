import 'package:curely/constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_prescriptions_cubit/get_delete_prescriptions_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_prescriptions_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayPrescriptionsView extends StatelessWidget {
  const DisplayPrescriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CustomAppBar(title: "Prescription"),
              ),
              BlocProvider(
                create: (context) => GetDeletePrescriptionsCubit(
                  prescriptionRepo: getIt<PrescriptionRepo>(),
                ),
                child: const DisplayPrescriptionsViewBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
