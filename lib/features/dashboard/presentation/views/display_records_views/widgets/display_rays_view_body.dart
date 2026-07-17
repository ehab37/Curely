import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'display_rays_loading.dart';
import 'display_rays_success.dart';

class DisplayRaysViewBody extends StatelessWidget {
  const DisplayRaysViewBody({super.key, this.isFavoriteView = false});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageRaysCubit, ManageRaysState>(
      listener: (context, state) {
        if (state is DeleteRaysFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeleteRaysSuccess) {
          InfoBox.successFloatingBox(
            context,
            context.tr("record_deleted_successfully"),
          );
        }
      },
      builder: (context, state) {
        if (state is GetRaysSuccess) {
          if (state.rays.isEmpty) {
            return isFavoriteView
                ? CustomEmptyWidget(title: context.tr("no_favorite_rays"))
                : CustomEmptyWidget(
                    title: context.tr("no_rays_found"),
                    subTitle: context.tr("no_rays_added"),
                  );
          }
          return DisplayRaysSuccess(raysList: state.rays);
        } else if (state is GetRaysFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManageRaysCubit>().getRays();
            },
          );
        } else {
          return DisplayRaysLoading();
        }
      },
    );
  }
}
