import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';
import 'records_dismissible_widget.dart';

class DisplayRaysViewBody extends StatefulWidget {
  const DisplayRaysViewBody({
    super.key,
    required this.isFavoriteView,
    this.searchText,
  });

  final bool isFavoriteView;
  final String? searchText;

  @override
  State<DisplayRaysViewBody> createState() => _DisplayRaysViewBodyState();
}

class _DisplayRaysViewBodyState extends State<DisplayRaysViewBody> {
  @override
  void initState() {
    if (widget.isFavoriteView) {
      context.read<ManageRaysCubit>().isFavoriteView = true;
    }
    context.read<ManageRaysCubit>().getRays(searchText: widget.searchText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRaysCubit, ManageRaysState>(
      builder: (context, state) {
        if (state is GetRaysSuccess) {
          if (state.rays.isEmpty) {
            return widget.isFavoriteView
                ? CustomEmptyWidget(title: "NO Favorite Rays Yet !...")
                : CustomEmptyWidget(
                    title: "No Rays Found",
                    subTitle: "You haven't added any rays yet!...",
                  );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return RecordsDismissibleWidget(
                recordKey: state.rays[index].docId!,
                onDismissed: (direction) {
                  context.read<ManageRaysCubit>().deleteRays(
                    docId: state.rays[index].docId!,
                  );
                  InfoBox.successFloatingBox(context, 'Rays deleted.');
                },
                content: GestureDetector(
                  onTap: () {
                    ManageRaysCubit cubit = context.read<ManageRaysCubit>();
                    GoRouter.of(context).push(
                      AppRoutesConstants.kRaysDetailsView,
                      extra: [state.rays[index], cubit],
                    );
                  },
                  child: DisplayedItem(
                    imageUrl: state.rays[index].imageUrls![0],
                    text1: state.rays[index].doctorName,
                    text2: state.rays[index].raysType,
                    text3: state.rays[index].examinationDate,
                    isFavorite: state.rays[index].isFavorite,
                    onTap: () {
                      context.read<ManageRaysCubit>().updateRays(
                        rays: state.rays[index]
                          ..isFavorite = !state.rays[index].isFavorite,
                      );
                    },
                  ),
                ),
              );
            },
            displayedList: state.rays,
          );
        } else if (state is GetRaysFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManageRaysCubit>().getRays();
            },
          );
        } else {
          if (state is DeleteRaysFailure) {
            InfoBox.errorFloatingBox(context, state.errMessage);
          } else if (state is DeleteRaysSuccess) {
            InfoBox.successFloatingBox(context, "Item deleted successfully.");
          }
          return CustomSkeletonizer(
            child: DisplayedListView(
              itemBuilder: (context, index) {
                return DisplayedItem(
                  text1: getDummyRays()[index].doctorName,
                  text2: getDummyRays()[index].raysType,
                  text3: getDummyRays()[index].examinationDate,
                );
              },
              displayedList: getDummyRays(),
            ),
          );
        }
      },
    );
  }
}
