import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({super.key});

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  final List<String> categories = [
    "Medicines",
    "Prescriptions",
    "Rays",
    "Analysis",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (selectedIndex != index) {
            setState(() {
              selectedIndex = index;
            });
          }
        },
        child: CategoryItem(
          isSelected: selectedIndex == index,
          name: categories[index],
        ),
      ),
    );
  }
}
