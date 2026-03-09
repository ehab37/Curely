import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController = TextEditingController();
  int currentCategoryIndex = 0;
  final List<String> categories = [
    "Medicines",
    "Prescriptions",
    "Rays",
    "Analysis",
  ];

  changeCategory({int? index}) async {
    emit(SearchLoading());
    if (index != null && currentCategoryIndex != index) {
      currentCategoryIndex = index;
    }
    await Future.delayed(Duration(milliseconds: 100));
    emit(CategoryChanged(currentIndex: currentCategoryIndex));
  }
}
