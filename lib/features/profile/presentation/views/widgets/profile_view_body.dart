import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'personal_details_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UserEntity user = getIt<UserDataRepo>().getUserDataLocally();
    return BlocConsumer<ManageProfileCubit, ManageProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        } else if (state is UploadImageFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        } else if (state is DeleteAccountFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        } else if (state is DeleteAccountSuccess) {
          GoRouter.of(
            context,
          ).pushReplacement(AppRoutesConstants.kRegisterView);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ManageProfileLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PersonalDetailsSection(user: user),
                40.verticalSpacing,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CustomNavBar(
                        text: "My Health Record",
                        prefixIcon: FontAwesomeIcons.notesMedical,
                        suffixIcon: Icons.arrow_forward_ios,
                        onPressed: () {},
                      ),
                      CustomNavBar(
                        text: "My Medications",
                        prefixIcon: FontAwesomeIcons.pills,
                        suffixIcon: Icons.arrow_forward_ios,
                        onPressed: () {},
                      ),
                      CustomNavBar(
                        text: "Language",
                        prefixIcon: Icons.language_outlined,
                        suffixIcon: Icons.arrow_forward_ios,
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).push(AppRoutesConstants.kLanguageView);
                        },
                      ),
                      CustomNavBar(
                        text: "Delete Account",
                        prefixIcon: Icons.delete_forever_outlined,
                        suffixIcon: Icons.arrow_forward_ios,
                        onPressed: () {
                          showAlertDialog(
                            context: context,
                            content: CustomAlertDialog(
                              dialogContext: context,
                              title: 'Delete Account?',
                              content:
                                  'Are you sure you want to delete your account and all your data?',
                              onDone: () {
                                context
                                    .read<ManageProfileCubit>()
                                    .deleteAccount(uId: user.uId);
                                GoRouter.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
