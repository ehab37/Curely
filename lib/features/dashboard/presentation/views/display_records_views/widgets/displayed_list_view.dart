import 'package:flutter/material.dart';

class DisplayedListView extends StatelessWidget {
  const DisplayedListView({
    super.key,
    required this.itemBuilder,
    required this.displayedList,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final List displayedList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.35,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: displayedList.length,
      itemBuilder: itemBuilder,
    );
  }
}
