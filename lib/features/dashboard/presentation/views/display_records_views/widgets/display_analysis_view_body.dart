import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';
import 'records_dismissible_widget.dart';

class DisplayAnalysisViewBody extends StatefulWidget {
  const DisplayAnalysisViewBody({
    super.key,
    required this.isFavoriteView,
    this.searchText,
  });

  final bool isFavoriteView;
  final String? searchText;

  @override
  State<DisplayAnalysisViewBody> createState() =>
      _DisplayAnalysisViewBodyState();
}

class _DisplayAnalysisViewBodyState extends State<DisplayAnalysisViewBody> {
  @override
  void initState() {
    if (widget.isFavoriteView) {
      context.read<ManageAnalysisCubit>().isFavoriteView = true;
    }
    context.read<ManageAnalysisCubit>().getAnalysis(
      searchText: widget.searchText,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAnalysisCubit, ManageAnalysisState>(
      builder: (context, state) {
        if (state is GetAnalysisSuccess) {
          if (state.analysis.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  widget.isFavoriteView
                      ? "NO Favorite Analysis added yet!..."
                      : "NO Analysis added yet!...",
                  style: Styles.styleBlue25,
                ),
              ),
            );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return RecordsDismissibleWidget(
                recordKey: state.analysis[index].docId!,
                onDismissed: (direction) {
                  context.read<ManageAnalysisCubit>().deleteAnalysis(
                    docId: state.analysis[index].docId!,
                  );
                  InfoBox.customSnackBar(context, 'Analysis deleted.');
                },
                content: GestureDetector(
                  onTap: () {
                    ManageAnalysisCubit cubit = context
                        .read<ManageAnalysisCubit>();
                    GoRouter.of(context).push(
                      AppRoutesConstants.kAnalysisDetailsView,
                      extra: [state.analysis[index], cubit],
                    );
                  },
                  child: DisplayedItem(
                    imageUrl: state.analysis[index].imageUrls![0],
                    text1: state.analysis[index].doctorName,
                    text2: state.analysis[index].analysisType,
                    text3: state.analysis[index].examinationDate,
                    isFavorite: state.analysis[index].isFavorite,
                    onTap: () {
                      context.read<ManageAnalysisCubit>().updateAnalysis(
                        analysis: state.analysis[index]
                          ..isFavorite = !state.analysis[index].isFavorite,
                      );
                    },
                  ),
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
                context.read<ManageAnalysisCubit>().getAnalysis();
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
