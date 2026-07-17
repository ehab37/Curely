import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'display_analysis_loading.dart';
import 'display_analysis_success.dart';

class DisplayAnalysisViewBody extends StatelessWidget {
  const DisplayAnalysisViewBody({super.key, this.isFavoriteView = false});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageAnalysisCubit, ManageAnalysisState>(
      listener: (context, state) {
        if (state is DeleteAnalysisFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeleteAnalysisSuccess) {
          InfoBox.successFloatingBox(
            context,
            context.tr("record_deleted_successfully"),
          );
        }
      },
      builder: (context, state) {
        if (state is GetAnalysisSuccess) {
          if (state.analysis.isEmpty) {
            return isFavoriteView
                ? CustomEmptyWidget(title: context.tr("no_fav_analysis"))
                : CustomEmptyWidget(
                    title: context.tr("no_analysis_found"),
                    subTitle: context.tr("no_analysis_added"),
                  );
          }
          return DisplayAnalysisSuccess(analysisList: state.analysis);
        } else if (state is GetAnalysisFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManageAnalysisCubit>().getAnalysis();
            },
          );
        } else {
          return DisplayAnalysisLoading();
        }
      },
    );
  }
}
