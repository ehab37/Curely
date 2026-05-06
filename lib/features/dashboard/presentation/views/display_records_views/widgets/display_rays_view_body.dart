import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'display_rays_loading.dart';
import 'display_rays_success.dart';

class DisplayRaysViewBody extends StatefulWidget {
  const DisplayRaysViewBody({
    super.key,
    required this.isFavoriteView,
    this.searchText,
  });

  final bool isFavoriteView;
  final String? searchText;

  @override
  State<DisplayRaysViewBody> createState() => _DisplayRaysViewBodyState();
}

class _DisplayRaysViewBodyState extends State<DisplayRaysViewBody> {
  @override
  void initState() {
    if (widget.isFavoriteView) {
      context.read<ManageRaysCubit>().isFavoriteView = true;
    }
    context.read<ManageRaysCubit>().getRays(searchText: widget.searchText);
    super.initState();
  }

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
            return widget.isFavoriteView
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
