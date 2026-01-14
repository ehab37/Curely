import 'package:cached_network_image/cached_network_image.dart';
import 'package:curely/constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/widgets/image_input/profile_image_input.dart';
import 'package:curely/core/widgets/custom_nav_bar.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
          inAsyncCall: state is EditProfileLoading ? true : false,
          child: Column(
            children: [
              CustomContainer(
                border: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 1),
                    ProfileImageInput(
                      imageUrl: user.imageUrl,
                      onSelectedImage: (image) {
                        user.image = image;
                        context.read<EditProfileCubit>().editProfile(
                          user: user,
                        );
                      },
                      onRemoveImage: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        user.imageUrl = null;
                        context.read<EditProfileCubit>().editProfile(
                          user: user,
                        );
                      },
                      imageWidget: user.imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: user.imageUrl!,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(color: kNavyColor),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : const Center(
                              child: Icon(
                                FontAwesomeIcons.circleUser,
                                size: 105,
                                color: kBlueColor,
                              ),
                            ),
                    ),
                    ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 30),
                          Icon(Icons.edit, color: Colors.white, size: 35),
                        ],
                      ),
                      title: Text(
                        user.name,
                        style: Styles.style28.copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        user.email,
                        style: Styles.style18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "last updated: 5/8 12:15 am",
                      style: Styles.styleWhite20.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
        );
      },
    );
  }
}
