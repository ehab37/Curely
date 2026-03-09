import 'package:curely/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFavIcon extends StatelessWidget {
  const CustomFavIcon({super.key, required this.isFav});

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border_outlined,
        size: 25,
        color: AppColors.primary,
      ),
    );
  }
}
