import 'dart:io';

import 'package:curely/constants.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'image_input.dart';

class GlobalImageInput extends StatefulWidget {
  const GlobalImageInput({
    super.key,
    required this.onSelectedImage,
    this.isMultiple = false,
  });

  final ValueChanged<File?> onSelectedImage;
  final bool isMultiple;

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
        width: MediaQuery.of(context).size.width,
        height: widget.isMultiple
            ? null
            : MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kNavyColor),
        ),
        child: imageFile != null && !widget.isMultiple
            ? Image.file(imageFile!, width: double.infinity, fit: BoxFit.fill)
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

// class GlobalImageInput extends StatefulWidget {
//   const GlobalImageInput({
//     super.key,
//     required this.onSelectedImages,
//     this.isMultiple = false,
//     this.showSelectedImages = false,
//   });
//
//   final ValueChanged<List<File>> onSelectedImages;
//   final bool isMultiple;
//   final bool showSelectedImages;
//
//   @override
//   State<GlobalImageInput> createState() => _GlobalImageInputState();
// }
//
// class _GlobalImageInputState extends State<GlobalImageInput> {
//   List<File> imageFiles = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return ImageInput(
//       isMultiple: widget.isMultiple,
//       selectedImages: imageFiles,
//       showSelectedImages: widget.showSelectedImages,
//       onSelectedImages: (value) {
//         imageFiles.addAll(value);
//         widget.onSelectedImages(imageFiles);
//         setState(() {});
//       },
//       content: Container(
//         alignment: Alignment.center,
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: kNavyColor),
//         ),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.add, color: kNavyColor, size: 28),
//               Text(' Pick Image', style: Styles.styleBlue20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
