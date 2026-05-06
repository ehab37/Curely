import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_analysis_cubit/add_analysis_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            didPop ? ScaffoldMessenger.of(context).clearSnackBars() : null,
        child: Scaffold(
          appBar: buildCustomAppBar(
            title: context.tr("add_analysis"),
            isBackable: true,
          ),
          body: Builder(
            builder: (context) {
              return BlocConsumer<AddAnalysisCubit, AddAnalysisState>(
                listener: (context, state) {
                  if (state is AddAnalysisSuccess) {
                    GoRouter.of(context).pop();
                  } else if (state is AddAnalysisFailure) {
                    InfoBox.errorFloatingBox(context, state.errMessage);
                  } else if (state is UploadImageFailure) {
                    InfoBox.errorFloatingBox(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  return CustomProgressHud(
                    isLoading: state is AddAnalysisLoading ? true : false,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingConstants.horizontalPadding,
                        ),
                        child: AddAnalysisViewBody(),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
