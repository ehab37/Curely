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
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: displayedList.length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
