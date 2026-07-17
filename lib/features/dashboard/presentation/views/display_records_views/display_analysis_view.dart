import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/display_analysis_view_body.dart';

class DisplayAnalysisView extends StatelessWidget {
  const DisplayAnalysisView({super.key, required this.isFavoriteView});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: isFavoriteView
            ? context.tr("favorite_analysis")
            : context.tr("analysis"),
        isBackable: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: BlocProvider(
            create: (context) =>
                ManageAnalysisCubit(analysisRepo: getIt<AnalysisRepo>())
                  ..getAnalysis(isFavoriteView: isFavoriteView),
            child: DisplayAnalysisViewBody(isFavoriteView: isFavoriteView),
          ),
        ),
      ),
    );
  }
}
