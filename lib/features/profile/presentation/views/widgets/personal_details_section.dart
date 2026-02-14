import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helpers/calculate_age.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/widgets/image_input/cached_image_widget.dart';
import 'package:curely/core/widgets/image_input/profile_image_input.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'name_and_gmail_section.dart';
import 'personal_detail_widget.dart';

class PersonalDetailsSection extends StatelessWidget {
  const PersonalDetailsSection({super.key, required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final int? age = calculateAge(user.dateOfBirth);
    return CustomContainer(
      height: MediaQuery.of(context).size.height * 0.48,
      border: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpacingConstants.horizontalPadding,
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            1.verticalSpacing,
            ProfileImageInput(
              imageUrl: user.imageUrl,
              onSelectedImage: (image) {
                context.read<EditProfileCubit>().editProfile(
                  user: user..image = image,
                );
              },
              onRemoveImage: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                user.imageUrl = null;
                context.read<EditProfileCubit>().editProfile(user: user);
              },
              imageWidget: CachedImageWidget(imageUrl: user.imageUrl),
            ),
            NameAndGmailSection(user: user),
            Row(
              children: [
                PersonalDetailWidget(
                  title: "Blood",
                  subTitle: user.blood == null || user.blood!.isEmpty
                      ? "TBD"
                      : user.blood!,
                  icon: Icons.water_drop_outlined,
                ),
                16.horizontalSpacing,
                PersonalDetailWidget(
                  title: "Height",
                  subTitle: "${user.height ?? "TBD"} CM",
                  icon: Icons.height,
                ),
              ],
            ),
            Row(
              children: [
                PersonalDetailWidget(
                  title: "Weight",
                  subTitle: "${user.weight ?? "TBD"} KG",
                  icon: Icons.monitor_weight_outlined,
                ),
                16.horizontalSpacing,
                PersonalDetailWidget(
                  title: "Age",
                  subTitle: "${age ?? "TBD"} Years",
                  icon: Icons.cake_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
