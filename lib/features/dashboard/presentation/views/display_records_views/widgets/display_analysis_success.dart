import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';
import 'records_dismissible_widget.dart';

class DisplayAnalysisSuccess extends StatelessWidget {
  const DisplayAnalysisSuccess({super.key, required this.analysisList});

  final List<AnalysisEntity> analysisList;

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return RecordsDismissibleWidget(
          recordKey: analysisList[index].docId!,
          onDismissed: (direction) {
            context.read<ManageAnalysisCubit>().deleteAnalysis(
              docId: analysisList[index].docId!,
            );
          },
          content: GestureDetector(
            onTap: () {
              ManageAnalysisCubit cubit = context.read<ManageAnalysisCubit>();
              GoRouter.of(context).push(
                AppRoutesConstants.kAnalysisDetailsView,
                extra: [analysisList[index], cubit],
              );
            },
            child: DisplayedItem(
              imageUrl: analysisList[index].imageUrls![0],
              text1: analysisList[index].doctorName,
              text2: context.tr(analysisList[index].analysisType),
              text3: analysisList[index].examinationDate,
              isFavorite: analysisList[index].isFavorite,
              onTap: () {
                context.read<ManageAnalysisCubit>().updateAnalysis(
                  analysis: analysisList[index]
                    ..isFavorite = !analysisList[index].isFavorite,
                );
              },
            ),
          ),
        );
      },
      displayedList: analysisList,
    );
  }
}
