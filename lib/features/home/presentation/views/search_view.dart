import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:curely/features/home/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SpacingConstants.horizontalPadding,
            ),
            child: SearchViewBody(),
          ),
        ),
      ),
    );
  }
}
