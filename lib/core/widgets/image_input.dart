import 'dart:io';

import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/widgets/icon_text_in_row.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onSelectedImage,
    required this.content,
  });

  final ValueChanged<File?> onSelectedImage;
  final Widget content;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? imageFile;
  InfoBox infoBox = InfoBox();

  _pickImage(ImageSource imageSource) {
    final ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: imageSource).then((value) {
      setState(() {
        imageFile = File(value!.path);
        widget.onSelectedImage(imageFile);
      });
      return imageFile;
    });
  }

  void _removeImage() {
    setState(() {
      imageFile = null;
      widget.onSelectedImage(imageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        infoBox.customImageSnackBar(
          context: context,
          content: imageFile == null
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        _pickImage(ImageSource.gallery);
                      },
                      child: IconTextInRow(
                        icon: Icons.image_outlined,
                        text: "From Gallery",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        _pickImage(ImageSource.camera);
                      },
                      child: IconTextInRow(
                        text: "From Camera",
                        icon: Icons.camera_alt_outlined,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        infoBox.customImageSnackBar(
                          context: context,
                          content: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(
                                    context,
                                  ).clearSnackBars();
                                  _pickImage(ImageSource.gallery);
                                },
                                child: IconTextInRow(
                                  icon: Icons.image_outlined,
                                  text: "From Gallery",
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(
                                    context,
                                  ).clearSnackBars();
                                  _pickImage(ImageSource.camera);
                                },
                                child: IconTextInRow(
                                  text: "From Camera",
                                  icon: Icons.camera_alt_outlined,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: IconTextInRow(
                        text: "Pick New Image",
                        icon: Icons.add,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        _removeImage();
                      },
                      child: IconTextInRow(
                        text: "Remove Image",
                        icon: Icons.remove_circle_outline,
                      ),
                    ),
                  ],
                ),
        );
      },
      child: widget.content,
    );
  }
}