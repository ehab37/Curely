import 'package:curely/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, this.isSelected = false, required this.name});

  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.onSecondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          name,
          style: isSelected
              ? Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeightHelper.bold,
                )
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
