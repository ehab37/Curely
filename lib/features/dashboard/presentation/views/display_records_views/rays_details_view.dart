import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/update_record_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/read_rays_widget.dart';

class RaysDetailsView extends StatelessWidget {
  const RaysDetailsView({super.key, required this.rays});

  final RaysEntity rays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('rays_details')),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showCustomBottomSheet(
                context,
                UpdateRecordDetails(
                  diagnosis: rays.diagnosis,
                  onSave: (diagnosis) {
                    context.read<ManageRaysCubit>().updateRays(
                      rays: rays..diagnosis = diagnosis,
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
                  title: context.tr('delete_rays_title'),
                  content: context.tr('delete_rays_content'),
                  onDone: () {
                    context
                        .read<ManagePrescriptionsCubit>()
                        .deletePrescriptions(docId: rays.docId!);
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<ManageRaysCubit, ManageRaysState>(
        listener: (context, state) {
          if (state is GetRaysFailure) {
            InfoBox.errorFloatingBox(context, state.errMessage);
          } else if (state is DeleteRaysSuccess) {
            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is ManageRaysLoading) {
            return const CustomLoadingIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReadRaysWidget(rays: rays),
          );
        },
      ),
    );
  }
}
