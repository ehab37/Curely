part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class CategoryChanged extends SearchState {
  final int currentIndex;

  CategoryChanged({required this.currentIndex});
}
