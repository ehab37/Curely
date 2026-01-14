import 'dart:io';
import 'package:flutter/material.dart';
import 'image_input.dart';

class ProfileImageInput extends StatelessWidget {
  const ProfileImageInput({
    super.key,
    required this.onSelectedImage,
    required this.imageWidget,
  });

  final ValueChanged<File?> onSelectedImage;
  final Widget imageWidget;

  @override
  Widget build(BuildContext context) {
    return ImageInput(
      onSelectedImage: (value) {
        onSelectedImage(value);
      },
      content: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        clipBehavior: Clip.hardEdge,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: imageWidget,
        ),
      ),
    );
  }
}
