import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_search_field.dart';
import 'package:curely/features/home/presentation/views/widgets/category_grid_view.dart';
import 'package:flutter/cupertino.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryGridView(),
        16.verticalSpacing,
        CustomSearchField(text: "Search about user's record"),
        12.verticalSpacing,
        Row(
          children: [
            Icon(CupertinoIcons.exclamationmark_circle),
            10.horizontalSpacing,
            Text(
              "Please, Search by National Id",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
