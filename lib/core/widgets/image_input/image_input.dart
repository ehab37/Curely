import 'dart:io';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/widgets/image_input/icon_text_in_row.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({
    super.key,
    required this.onSelectedImage,
    required this.content,
    this.imageUrl,
    this.onRemoveImage,
    this.imageFile,
  });

  final ValueChanged<File?> onSelectedImage;
  final Widget content;
  final String? imageUrl;
  final void Function()? onRemoveImage;
  final File? imageFile;

  void _pickImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image != null) {
      onSelectedImage(File(image.path));
    }
  }

  void _removeImage() {
    onSelectedImage(null);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        InfoBox.customImageSnackBar(
          context: context,
          content: (imageUrl == null || imageUrl!.isEmpty) && imageFile == null
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
                        InfoBox.customImageSnackBar(
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
                      onTap:
                          onRemoveImage ??
                          () {
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
      child: content,
    );
  }
}
