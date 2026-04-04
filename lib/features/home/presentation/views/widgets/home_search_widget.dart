import 'package:curely/features/home/domain/entities/search_suggestion_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_search_bar.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({super.key});

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  final SearchController _controller = SearchController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: _controller,
      viewHintText: 'Search for Pages or actions...',
      headerTextStyle: Theme.of(context).textTheme.bodySmall,
      viewBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      dividerColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      headerHeight: 50,
      isFullScreen: false,
      viewConstraints: BoxConstraints.tightFor(
        width: MediaQuery.widthOf(context) - 60,
      ),
      viewLeading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      builder: (BuildContext context, SearchController controller) {
        return HomeSearchBar(controller: controller, focusNode: focusNode);
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final String keyword = controller.value.text.toLowerCase();
        final suggestions = SearchSuggestionEntity.getSuggestionsList();
        return suggestions
            .where(
              (suggestion) => suggestion.title.toLowerCase().contains(keyword),
            )
            .map((suggestion) {
              return ListTile(
                leading: Icon(suggestion.icon, size: 20),
                title: Text(
                  suggestion.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () {
                  controller.closeView(null);
                  controller.clear();
                  focusNode.unfocus();
                  suggestion.onTap(context);
                },
              );
            });
      },
    );
  }
}
