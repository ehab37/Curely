import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widgets/add_medicine_view_body.dart';

class AddMedicineView extends StatelessWidget {
  const AddMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMedicineCubit(
        imagesRepo: getIt<ImagesRepo>(),
        medicineRepo: getIt<MedicineRepo>(),
        medicineNotificationRepo: getIt<MedicineNotificationRepo>(),
      ),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<AddMedicineCubit, AddMedicineState>(
              listener: (context, state) {
                if (state is AddMedicineSuccess) {
                  GoRouter.of(context).pop();
                } else if (state is AddMedicineFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                } else if (state is UploadImageFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                } else if (state is AddMedicineNotificationFailure) {
                  InfoBox.customSnackBar(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is AddMedicineLoading ? true : false,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding,
                      ),
                      child: Column(
                        children: [
                          CustomAppBar(title: "Add Medicine"),
                          AddMedicineViewBody(),
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
