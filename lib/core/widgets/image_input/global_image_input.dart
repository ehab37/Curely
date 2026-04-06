import 'dart:io';
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
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: imageFile != null && !widget.isMultiple
            ? Image.file(imageFile!, width: double.infinity, fit: BoxFit.fill)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 28),
                    Text(
                      ' Pick Image',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
