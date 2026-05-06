import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/widgets/image_input/profile_cached_image_widget.dart';
import 'package:curely/core/widgets/image_input/profile_image_input.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'name_and_gmail_section.dart';
import 'personal_details_grid_view.dart';

class PersonalDetailsSection extends StatelessWidget {
  const PersonalDetailsSection({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.viewPaddingOf(context).top;
    return CustomContainer(
      border: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingConstants.horizontalPadding,
        ),
        child: Column(
          children: [
            (statusBarHeight + 5).verticalSpacing,
            ProfileImageInput(
              imageUrl: user.imageUrl,
              onSelectedImage: (image) {
                context.read<ManageProfileCubit>().editProfile(
                  user: user..image = image,
                );
              },
              onRemoveImage: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                user.imageUrl = null;
                context.read<ManageProfileCubit>().editProfile(user: user);
              },
              imageWidget: ProfileCachedImageWidget(imageUrl: user.imageUrl),
            ),
            NameAndGmailSection(user: user),
            15.verticalSpacing,
            PersonalDetailsGridView(user: user),
            20.verticalSpacing,
          ],
        ),
      ),
    );
  }
}
