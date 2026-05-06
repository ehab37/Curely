import 'dart:io';
import 'package:curely/core/constants/spacing_constants.dart';
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
        height: MediaQuery.of(context).size.height / 4,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                AspectRatio(
                  aspectRatio: .7,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                        SpacingConstants.borderRadius,
                      ),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      image: DecorationImage(
                        image: FileImage(widget.images[index]),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
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
