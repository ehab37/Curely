import 'dart:io';
import 'package:curely/constants.dart';
import 'package:flutter/material.dart';

class ImagesListViewWidget extends StatefulWidget {
  const ImagesListViewWidget({super.key, required this.images});
  final List<File> images;

  @override
  State<ImagesListViewWidget> createState() => _ImagesListViewWidgetState();
}

class _ImagesListViewWidgetState extends State<ImagesListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.images.isNotEmpty,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    image: DecorationImage(
                      image: FileImage(widget.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      widget.images.removeAt(index);
                      setState(() {});
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
