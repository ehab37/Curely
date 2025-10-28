import 'dart:io';

import 'package:curely/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';


class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onSelectedImage,
  });
  final Function(File image) onSelectedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? imageFile;

  _pickImage(ImageSource imageSource) {
    final ImagePicker imagePicker = ImagePicker();
    imagePicker
        .pickImage(
      source: imageSource,
    )
        .then((value) {
      setState(() {
        imageFile = File(value!.path);
      });
      widget.onSelectedImage(imageFile!);
      return imageFile;
    });
  }
  void _removeImage() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: kBlueColor,
            size: 28,
          ),
          Text(
            ' Pick Image',
            style: TextStyle(
              fontSize: 20,
              color: kBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    if (imageFile != null) {
      setState(() {
        content = Image.file(
          imageFile!,
          height: 280,
          width: double.infinity,
          fit: BoxFit.fill,
        );
      });
    }

    return GestureDetector(
      onTap: () {
        SnackBar snackBar = SnackBar(
          backgroundColor: Colors.white,
          shape: Border(
            top: BorderSide(
              color: kBlueColor,
              width: 2,
            ),
          ),
          content: imageFile == null
              ? Column(
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  _pickImage(ImageSource.gallery);
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        color: kBlueColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'From Gallery',
                        style: TextStyle(color: kBlueColor),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  _pickImage(ImageSource.camera);
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: kBlueColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'From Camera',
                        style: TextStyle(
                          color: kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : Column(
            children: [
              GestureDetector(
                onTap: () {
                  SnackBar snackBar = SnackBar(
                    backgroundColor: Colors.white,
                    shape: Border(
                      top: BorderSide(
                        color: kBlueColor,
                        width: 2,
                      ),
                    ),
                    content: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .clearSnackBars();
                            _pickImage(ImageSource.gallery);
                          },
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: kBlueColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'From Gallery',
                                  style: TextStyle(color: kBlueColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .clearSnackBars();
                            _pickImage(ImageSource.camera);
                          },
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: kBlueColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'From Camera',
                                  style: TextStyle(
                                    color: kBlueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: kBlueColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Pick New Image',
                        style: TextStyle(color: kBlueColor),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  _removeImage();
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        color: kBlueColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Remove Image',
                        style: TextStyle(
                          color: kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        alignment: Alignment.center,
        height: 250,
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: kBlueColor,
          ),
        ),
        child: content,
      ),
    );
  }
}

class ImageInputProfile extends StatefulWidget {
  const ImageInputProfile({
    super.key,
    required this.onSelectedImage,
  });
  final Function(File image) onSelectedImage;

  @override
  State<ImageInputProfile> createState() => _ImageInputProfileState();
}

class _ImageInputProfileState extends State<ImageInputProfile> {
  File? imageFile;

  _pickImage(ImageSource imageSource) {
    final ImagePicker imagePicker = ImagePicker();
    imagePicker
        .pickImage(
      source: imageSource,
    )
        .then((value) {
      setState(() {
        imageFile = File(value!.path);
      });
      widget.onSelectedImage(imageFile!);
      return imageFile;
    });
  }

  void _removeImage() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Icon(
        FontAwesomeIcons.circleUser,
        size: 115,
      ),
    );
    if (imageFile != null) {
      setState(() {
        content = Image.file(
          imageFile!,
          height: 120,
          fit: BoxFit.fill,
        );
      });
    }

    return GestureDetector(
      onTap: () {
        SnackBar snackBar = SnackBar(
          backgroundColor: Colors.white,
          shape: Border(
            top: BorderSide(
              color: kBlueColor,
              width: 2,
            ),
          ),
          content: imageFile == null
              ? Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        _pickImage(ImageSource.gallery);
                      },
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: kBlueColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'From Gallery',
                              style: TextStyle(color: kBlueColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        _pickImage(ImageSource.camera);
                      },
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: kBlueColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'From Camera',
                              style: TextStyle(
                                color: kBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        SnackBar snackBar = SnackBar(
                          backgroundColor: Colors.white,
                          shape: Border(
                            top: BorderSide(
                              color: kBlueColor,
                              width: 2,
                            ),
                          ),
                          content: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  _pickImage(ImageSource.gallery);
                                },
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: kBlueColor,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'From Gallery',
                                        style: TextStyle(color: kBlueColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  _pickImage(ImageSource.camera);
                                },
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: kBlueColor,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'From Camera',
                                        style: TextStyle(
                                          color: kBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: kBlueColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Pick New Image',
                              style: TextStyle(color: kBlueColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        _removeImage();
                      },
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_circle_outline,
                              color: kBlueColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Remove Image',
                              style: TextStyle(
                                color: kBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        clipBehavior: Clip.hardEdge,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: content,
        ),
      ),
    );
  }
}
