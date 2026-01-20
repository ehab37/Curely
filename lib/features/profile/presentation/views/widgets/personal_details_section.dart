import 'package:curely/constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/widgets/image_input/cached_image_widget.dart';
import 'package:curely/core/widgets/image_input/profile_image_input.dart';
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
    return CustomContainer(
      height: MediaQuery.of(context).size.height * 0.48,
      border: const BorderRadius.only(
        bottomLeft: Radius.circular(80),
        bottomRight: Radius.circular(80),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 1),
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
                  subTitle: "A+",
                  icon: Icons.water_drop_outlined,
                ),
                SizedBox(width: 20),
                PersonalDetailWidget(
                  title: "Height",
                  subTitle: "175 CM",
                  icon: Icons.access_alarms,
                ),
              ],
            ),
            Row(
              children: [
                PersonalDetailWidget(
                  title: "Weight",
                  subTitle: "110 KG",
                  icon: Icons.access_alarms,
                ),
                SizedBox(width: 20),
                PersonalDetailWidget(
                  title: "Age",
                  subTitle: "25 Years",
                  icon: Icons.access_alarms,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
