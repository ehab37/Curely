import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/record_details_item_entity.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/details_image_item.dart';
import 'package:flutter/material.dart';
import 'images_list_view.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.imagesList,
    required this.detailsList,
  });

  final List<String> imagesList;
  final List<RecordDetailsItemEntity> detailsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: imagesList.length == 1
              ? DetailsImageItem(imageUrl: imagesList[0])
              : ImagesListView(imagesList: imagesList),
        ),
        24.verticalSpacing,
        ...detailsList.map(
          (e) => Card(
            child: ListTile(
              leading: Icon(e.icon),
              title: Text(e.title),
              subtitle: Text(e.subTitle),
            ),
          ),
        ),
      ],
    );
  }
}
