import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_container.dart';
import 'package:curely/core/widgets/profile_image_input.dart';
import 'package:curely/features/home/presentation/views/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          border: const BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 1,),
              ProfileImageInput(
                onSelectedImage: (image) {
                  // BlocProvider.of<ProfileImageCubit>(context)
                  //     .addProfileImage(imageFile: image);
                },
              ),
              ListTile(
                leading: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 30,),
                    Icon(Icons.edit, color: Colors.white, size: 35),
                  ],
                ),
                title: Text(
                  "Ehab Mostafa",
                  style: Styles.style28.copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  "hobamostafa205@gmail.com",
                  style: Styles.style18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "last updated: 5/8 12:15 am",
                style: Styles.styleWhite20.copyWith(fontWeight: FontWeight.normal),
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
    );
  }
}
