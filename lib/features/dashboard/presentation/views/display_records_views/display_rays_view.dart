import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/display_rays_view_body.dart';

class DisplayRaysView extends StatelessWidget {
  const DisplayRaysView({super.key, required this.isFavoriteView});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        title: isFavoriteView
            ? context.tr("favorite_rays")
            : context.tr("rays"),
        isBackable: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: BlocProvider(
            create: (context) => ManageRaysCubit(
              raysRepo: getIt<RaysRepo>(),
              imagesRepo: getIt<ImagesRepo>(),
            )..getRays(isFavoriteView: isFavoriteView),
            child: DisplayRaysViewBody(isFavoriteView: isFavoriteView),
          ),
        ),
      ),
    );
  }
}
