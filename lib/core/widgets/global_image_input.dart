import 'dart:io';

import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'image_input.dart';

class GlobalImageInput extends StatefulWidget {
  const GlobalImageInput({super.key, required this.onSelectedImage});

  final ValueChanged<File?> onSelectedImage;

  @override
  State<GlobalImageInput> createState() => _GlobalImageInputState();
}

class _GlobalImageInputState extends State<GlobalImageInput> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return ImageInput(
      onSelectedImage: (value) {
        imageFile = value;
        widget.onSelectedImage(value);
        setState(() {});
      },
      content: Container(
        alignment: Alignment.center,
        height: 250,
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kBlueColor),
        ),
        child: imageFile != null
            ? Image.file(
          imageFile!,
          height: 280,
          width: double.infinity,
          fit: BoxFit.fill,
        )
            : Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: kNavyColor, size: 28),
              Text(' Pick Image', style: Styles.styleBlue20),
            ],
          ),
        ),
      ),
    );
  }
}