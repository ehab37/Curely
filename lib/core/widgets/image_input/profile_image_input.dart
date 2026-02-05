import 'dart:io';
import 'package:flutter/material.dart';
import 'image_input.dart';

class ProfileImageInput extends StatelessWidget {
  const ProfileImageInput({
    super.key,
    required this.onSelectedImage,
    required this.imageWidget,
    this.imageUrl,
    required this.onRemoveImage,
  });

  final ValueChanged<File?> onSelectedImage;
  final Widget imageWidget;
  final String? imageUrl;
  final void Function() onRemoveImage;

  @override
  Widget build(BuildContext context) {
    return ImageInput(
      imageUrl: imageUrl,
      onSelectedImage: (value) {
        onSelectedImage(value);
      },
      onRemoveImage: onRemoveImage,
      content: imageWidget,
    );
  }
}
