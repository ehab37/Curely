import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final SearchController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      focusNode: focusNode,
      hintText: 'Search for Pages...',
      constraints: BoxConstraints(minHeight: 50),
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).textTheme.bodyMedium,
      ),
      textStyle: WidgetStateProperty.all(
        Theme.of(context).textTheme.bodyMedium,
      ),
      padding: const WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16.0),
      ),
      onTap: () {
        controller.openView();
      },
      onChanged: (_) {
        controller.openView();
      },
      leading: const Icon(FontAwesomeIcons.magnifyingGlass, size: 20),
      backgroundColor: WidgetStateProperty.all(
        Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
