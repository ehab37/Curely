import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:curely/features/home/presentation/views/widgets/search_result.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          suffixIcon: FontAwesomeIcons.magnifyingGlass,
          suffixPress: () => context.read<SearchCubit>().changeCategory(),
          controller: context.read<SearchCubit>().searchController,
          label: context.tr('search_at_records'),
        ),
        12.verticalSpacing,
        CategoryGridView(),
        Divider(height: 32),
        Expanded(child: SearchResult()),
      ],
    );
  }
}
