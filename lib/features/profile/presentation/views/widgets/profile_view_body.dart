import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'personal_details_section.dart';
import 'profile_view_navigators.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = getIt<UserDataRepo>().getUserDataLocally();
    return BlocConsumer<ManageProfileCubit, ManageProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is UploadImageFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeleteAccountFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        } else if (state is DeleteAccountSuccess) {
          InfoBox.successFloatingBox(context, "Deleted Account Successfully");
          GoRouter.of(
            context,
          ).pushReplacement(AppRoutesConstants.kRegisterView);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ManageProfileLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PersonalDetailsSection(user: user),
                40.verticalSpacing,
                ProfileViewNavigators(user: user),
              ],
            ),
          ),
        );
      },
    );
  }
}
