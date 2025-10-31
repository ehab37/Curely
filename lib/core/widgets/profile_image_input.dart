import 'dart:io';

import 'package:curely/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'image_input.dart';

class ProfileImageInput extends StatefulWidget {
  const ProfileImageInput({super.key, required this.onSelectedImage});

  final ValueChanged<File?> onSelectedImage;

  @override
  State<ProfileImageInput> createState() => _ProfileImageInputState();
}

class _ProfileImageInputState extends State<ProfileImageInput> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return ImageInput(
      onSelectedImage: (value) {
        imageFile = value;
        widget.onSelectedImage(value);
        setState(() {});
      },
      content: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        clipBehavior: Clip.hardEdge,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: imageFile != null
              ? Image.file(imageFile!, height: 120, fit: BoxFit.fill)
              : const Center(
            child: Icon(
              FontAwesomeIcons.circleUser,
              size: 105,
              color: kBlueColor,
            ),
          ),
        ),
      ),
    );
  }
}
