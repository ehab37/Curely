import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/home/presentation/views/widgets/favorite_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: context.tr("favorite_records"),
        icon: FontAwesomeIcons.solidHeart,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: const FavoriteViewBody(),
        ),
      ),
    );
  }
}
