import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:curely/features/home/presentation/views/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Row(
                children: [
                  Text(" Search", style: Styles.style33),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 28,
                    color: AppColors.primary,
                  ),
                ],
              ),
              8.verticalSpacing,
            ],
          ),
        ),
        CategoryGridView(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              16.verticalSpacing,
              CustomTextFormField(
                suffixIcon: FontAwesomeIcons.magnifyingGlass,
                suffixPress: () => context.read<SearchCubit>().changeCategory(),
                controller: context.read<SearchCubit>().searchController,
                label: 'Search at records',
              ),
              12.verticalSpacing,
            ],
          ),
        ),
        SearchResult(),
      ],
    );
  }
}
