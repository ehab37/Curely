import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/details_image_item.dart';
import 'package:flutter/material.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({super.key, required this.imagesList});

  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: imagesList.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: .7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DetailsImageItem(imageUrl: imagesList[index]),
          ),
        );
      },
    );
  }
}
