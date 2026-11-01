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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.35,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: displayedList.length,
      itemBuilder: itemBuilder,
    );
  }
}
