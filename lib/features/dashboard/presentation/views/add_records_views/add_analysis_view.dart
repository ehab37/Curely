import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_analysis_cubit/add_analysis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widgets/add_analysis_view_body.dart';

class AddAnalysisView extends StatelessWidget {
  const AddAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAnalysisCubit(
        imagesRepo: getIt<ImagesRepo>(),
        analysisRepo: getIt<AnalysisRepo>(),
      ),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<AddAnalysisCubit, AddAnalysisState>(
              listener: (context, state) {
                if (state is AddAnalysisSuccess) {
                  GoRouter.of(context).pop();
                } else if (state is AddAnalysisFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                } else if (state is UploadImageFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is AddAnalysisLoading ? true : false,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding,
                      ),
                      child: Column(
                        children: [
                          CustomAppBar(title: "Add Analysis"),
                          AddAnalysisViewBody(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
