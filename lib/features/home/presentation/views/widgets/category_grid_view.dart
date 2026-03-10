import 'package:curely/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cubit.categories.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              cubit.changeCategory(index: index);
            },
            child: CategoryItem(
              isSelected: cubit.currentCategoryIndex == index,
              name: cubit.categories[index],
            ),
          ),
        );
      },
    );
  }
}
