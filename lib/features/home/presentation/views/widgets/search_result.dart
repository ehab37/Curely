import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_analysis_view_body.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_medicines_view_body.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_prescriptions_view_body.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/display_rays_view_body.dart';
import 'package:curely/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:curely/features/profile/domain/repos/notes_repo.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/notes_view_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is CategoryChanged) {
          switch (state.currentIndex) {
            case 0:
              return BlocProvider(
                create: (context) => ManageMedicinesCubit(
                  medicineRepo: getIt<MedicineRepo>(),
                  medicineNotificationRepo: getIt<MedicineNotificationRepo>(),
                ),
                child: DisplayMedicinesViewBody(
                  isRemindersView: false,
                  isFavoriteView: false,
                  searchText: context.read<SearchCubit>().searchController.text,
                ),
              );
            case 1:
              return BlocProvider(
                create: (context) => ManagePrescriptionsCubit(
                  prescriptionRepo: getIt<PrescriptionRepo>(),
                ),
                child: DisplayPrescriptionsViewBody(
                  isFavoriteView: false,
                  searchText: context.read<SearchCubit>().searchController.text,
                ),
              );
            case 2:
              return BlocProvider(
                create: (context) =>
                    ManageRaysCubit(raysRepo: getIt<RaysRepo>()),
                child: DisplayRaysViewBody(
                  isFavoriteView: false,
                  searchText: context.read<SearchCubit>().searchController.text,
                ),
              );
            case 3:
              return BlocProvider(
                create: (context) =>
                    ManageAnalysisCubit(analysisRepo: getIt<AnalysisRepo>()),
                child: DisplayAnalysisViewBody(
                  isFavoriteView: false,
                  searchText: context.read<SearchCubit>().searchController.text,
                ),
              );
            case 4:
              return BlocProvider(
                create: (context) =>
                    ManageNotesCubit(notesRepo: getIt<NotesRepo>()),
                child: NotesViewBody(
                  isFavoriteView: false,
                  searchText: context.read<SearchCubit>().searchController.text,
                ),
              );
          }
        } else if (state is SearchLoading) {
          return CustomLoadingIndicator();
        }
        return Row(
          children: [
            Icon(CupertinoIcons.exclamationmark_circle),
            10.horizontalSpacing,
            Text(
              "Please, Select a category to search",
              style: TextStyle(fontSize: 18),
            ),
          ],
        );
      },
    );
  }
}
