import 'package:cached_network_image/cached_network_image.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.list});

  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(AppRoutesConstants.kImageView, extra: list[index]);
              },
              child: Hero(
                tag: list[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: list[index],
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error_outline),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
