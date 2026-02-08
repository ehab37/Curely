import 'dart:io';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'image_input.dart';

class GlobalImageInput extends StatefulWidget {
  const GlobalImageInput({
    super.key,
    required this.onSelectedImage,
    this.isMultiple = false,
    this.imageFile,
  });

  final ValueChanged<File?> onSelectedImage;
  final bool isMultiple;
  final File? imageFile;

  @override
  State<GlobalImageInput> createState() => _GlobalImageInputState();
}

class _GlobalImageInputState extends State<GlobalImageInput> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return ImageInput(
      imageFile: widget.imageFile,
      onSelectedImage: (value) {
        imageFile = value;
        widget.onSelectedImage(value);
        setState(() {});
      },
      content: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: widget.isMultiple
            ? null
            : MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMedium),
        ),
        child: imageFile != null && !widget.isMultiple
            ? Image.file(imageFile!, width: double.infinity, fit: BoxFit.fill)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: AppColors.primary, size: 28),
                    Text(' Pick Image', style: Styles.styleBlue20),
                  ],
                ),
              ),
      ),
    );
  }
}
