import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'personal_details_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity user = getFinalUserData();
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        } else if (state is UploadImageFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditProfileLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PersonalDetailsSection(user: user),
                const SizedBox(height: 40),
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
