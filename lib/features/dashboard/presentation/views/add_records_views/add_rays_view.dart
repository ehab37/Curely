import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_rays_cubit/add_rays_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
          body: Builder(
            builder: (context) {
              return BlocConsumer<AddRaysCubit, AddRaysState>(
                listener: (context, state) {
                  if (state is AddRaysSuccess) {
                    GoRouter.of(context).pop();
                  } else if (state is AddRaysFailure) {
                    InfoBox.customSnackBar(context, state.errMessage);
                  } else if (state is UploadImageFailure) {
                    InfoBox.customSnackBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is AddRaysLoading ? true : false,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kHorizontalPadding,
                        ),
                        child: Column(
                          children: [
                            CustomAppBar(title: "Add Rays"),
                            AddRaysViewBody(),
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
      ),
    );
  }
}
