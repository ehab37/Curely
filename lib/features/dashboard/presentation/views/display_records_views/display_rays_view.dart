import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_app_bar.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/display_rays_view_body.dart';

class DisplayRaysView extends StatelessWidget {
  const DisplayRaysView({super.key, required this.isFavoriteView});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SpacingConstants.horizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomAppBar(
                  title: isFavoriteView ? "Favorite Rays" : "Rays",
                ),
              ),
              BlocProvider(
                create: (context) =>
                    ManageRaysCubit(raysRepo: getIt<RaysRepo>()),
                child: DisplayRaysViewBody(isFavoriteView: isFavoriteView),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
