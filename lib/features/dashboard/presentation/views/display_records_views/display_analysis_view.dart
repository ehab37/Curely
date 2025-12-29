import 'package:curely/constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_analysis_cubit/get_delete_analysis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/display_analysis_view_body.dart';

class DisplayAnalysisView extends StatelessWidget {
  const DisplayAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CustomAppBar(title: "Analysis")),
              BlocProvider(
                create: (context) =>
                    GetDeleteAnalysisCubit(analysisRepo: getIt<AnalysisRepo>()),
                child: DisplayAnalysisViewBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
