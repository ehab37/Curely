import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController = TextEditingController();
  int currentCategoryIndex = 0;
  final List<String> categories = [
    "medicines",
    "prescription",
    "rays",
    "analysis",
    "health_notes",
  ];

  changeCategory({int? index}) async {
    emit(SearchLoading());
    if (index != null && currentCategoryIndex != index) {
      currentCategoryIndex = index;
    }
    await Future.delayed(const Duration(milliseconds: 100));
    emit(CategoryChanged(currentIndex: currentCategoryIndex));
  }
}
