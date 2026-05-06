import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Theme.of(context).colorScheme.primaryContainer.withAlpha(30),
      ),
      child: child,
    );
  }
}
