import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_rays_cubit/add_rays_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/add_rays_view_body.dart';

class AddRaysView extends StatelessWidget {
  const AddRaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRaysCubit(
        imagesRepo: getIt<ImagesRepo>(),
        raysRepo: getIt<RaysRepo>(),
      ),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            didPop ? ScaffoldMessenger.of(context).clearSnackBars() : null,
        child: Scaffold(
          appBar: buildCustomAppBar(
            title: context.tr("add_rays"),
            isBackable: true,
          ),
          body: Builder(
            builder: (context) {
              return BlocConsumer<AddRaysCubit, AddRaysState>(
                listener: (context, state) {
                  if (state is AddRaysSuccess) {
                    GoRouter.of(context).pop();
                  } else if (state is AddRaysFailure) {
                    InfoBox.errorFloatingBox(context, state.errMessage);
                  } else if (state is UploadImageFailure) {
                    InfoBox.errorFloatingBox(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  return CustomProgressHud(
                    isLoading: state is AddRaysLoading ? true : false,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingConstants.horizontalPadding,
                        ),
                        child: AddRaysViewBody(),
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
