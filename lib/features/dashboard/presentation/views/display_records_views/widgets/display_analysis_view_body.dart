import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helper_functions/get_dummy_data.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_analysis_cubit/get_delete_analysis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayAnalysisViewBody extends StatefulWidget {
  const DisplayAnalysisViewBody({super.key});

  @override
  State<DisplayAnalysisViewBody> createState() =>
      _DisplayAnalysisViewBodyState();
}

class _DisplayAnalysisViewBodyState extends State<DisplayAnalysisViewBody> {
  @override
  void initState() {
    context.read<GetDeleteAnalysisCubit>().getAnalysis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeleteAnalysisCubit, GetDeleteAnalysisState>(
      builder: (context, state) {
        if (state is GetAnalysisSuccess) {
          if (state.analysis.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "NO Analysis added yet!...",
                  style: Styles.styleBlue25,
                ),
              ),
            );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(state.analysis[index].docId!),
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
                onDismissed: (direction) => context
                    .read<GetDeleteAnalysisCubit>()
                    .deleteAnalysis(docId: state.analysis[index].docId!),
                child: DisplayedItem(
                  imageUrl: state.analysis[index].imageUrls![0],
                  text1: state.analysis[index].doctorName,
                  text2: state.analysis[index].analysisType,
                  text3: state.analysis[index].examinationDate,
                ),
              );
            },
            displayedList: state.analysis,
          );
        } else if (state is GetAnalysisFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              error: state.errMessage,
              onTryAgain: () {
                context.read<GetDeleteAnalysisCubit>().getAnalysis();
              },
            ),
          );
        } else {
          if (state is DeleteAnalysisFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeleteAnalysisSuccess) {
            InfoBox.customSnackBar(context, "Item deleted successfully.");
          }
          return Skeletonizer.sliver(
            child: DisplayedListView(
              itemBuilder: (context, index) {
                return DisplayedItem(
                  text1: getDummyAnalysis()[index].doctorName,
                  text2: getDummyAnalysis()[index].analysisType,
                  text3: getDummyAnalysis()[index].examinationDate,
                );
              },
              displayedList: getDummyAnalysis(),
            ),
          );
        }
      },
    );
  }
}
