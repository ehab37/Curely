import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/home/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
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
              SearchViewBody(),
            ],
          ),
        ),
      ),
    );
  }
}
