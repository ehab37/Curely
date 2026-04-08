import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/update_record_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/read_analysis_widget.dart';

class AnalysisDetailsView extends StatelessWidget {
  const AnalysisDetailsView({super.key, required this.analysis});

  final AnalysisEntity analysis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('analysis_details')),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showCustomBottomSheet(
                context,
                UpdateRecordDetails(
                  diagnosis: analysis.diagnosis,
                  onSave: (diagnosis) {
                    context.read<ManageAnalysisCubit>().updateAnalysis(
                      analysis: analysis..diagnosis = diagnosis,
                    );
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () {
              showAlertDialog(
                context: context,
                content: CustomAlertDialog(
                  dialogContext: context,
                  title: context.tr('delete_analysis_title'),
                  content: context.tr('delete_analysis_content'),
                  onDone: () {
                    context.read<ManageAnalysisCubit>().deleteAnalysis(
                      docId: analysis.docId!,
                    );
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ManageAnalysisCubit, ManageAnalysisState>(
        listener: (context, state) {
          if (state is GetAnalysisFailure) {
            InfoBox.errorFloatingBox(context, state.errMessage);
          } else if (state is DeleteAnalysisSuccess) {
            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is ManageAnalysisLoading) {
            return const CustomLoadingIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReadAnalysisWidget(analysis: analysis),
          );
        },
      ),
    );
  }
}
