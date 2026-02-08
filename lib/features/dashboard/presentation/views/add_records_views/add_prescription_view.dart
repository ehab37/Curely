import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_prescription_cubit/add_prescription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widgets/add_prescription_view_body.dart';

class AddPrescriptionView extends StatelessWidget {
  const AddPrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPrescriptionCubit(
        imagesRepo: getIt<ImagesRepo>(),
        prescriptionRepo: getIt<PrescriptionRepo>(),
      ),
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            didPop ? ScaffoldMessenger.of(context).clearSnackBars() : null,
        child: Scaffold(
          body: Builder(
            builder: (context) {
              return BlocConsumer<AddPrescriptionCubit, AddPrescriptionState>(
                listener: (context, state) {
                  if (state is AddPrescriptionSuccess) {
                    GoRouter.of(context).pop();
                  } else if (state is AddPrescriptionFailure) {
                    InfoBox.customSnackBar(context, state.errMessage);
                  } else if (state is UploadImageFailure) {
                    InfoBox.customSnackBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is AddPrescriptionLoading ? true : false,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SpacingConstants.horizontalPadding,
                        ),
                        child: Column(
                          children: [
                            CustomAppBar(title: "Add Prescription"),
                            AddPrescriptionViewBody(),
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
