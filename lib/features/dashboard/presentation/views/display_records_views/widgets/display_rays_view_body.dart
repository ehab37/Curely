import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/get_dummy_data.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/features/dashboard/presentation/cubits/get_delete_rays_cubit/get_delete_rays_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';

class DisplayRaysViewBody extends StatefulWidget {
  const DisplayRaysViewBody({super.key});

  @override
  State<DisplayRaysViewBody> createState() => _DisplayRaysViewBodyState();
}

class _DisplayRaysViewBodyState extends State<DisplayRaysViewBody> {
  @override
  void initState() {
    context.read<GetDeleteRaysCubit>().getRays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeleteRaysCubit, GetDeleteRaysState>(
      builder: (context, state) {
        if (state is GetRaysSuccess) {
          if (state.rays.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text("NO Rays added yet!...", style: Styles.styleBlue25),
              ),
            );
          }
          return DisplayedListView(
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(state.rays[index].docId!),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(kBorderRadius),
                    color: kErrorColor,
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) => context
                    .read<GetDeleteRaysCubit>()
                    .deleteRays(docId: state.rays[index].docId!),
                child: DisplayedItem(
                  imageUrl: state.rays[index].imageUrls![0],
                  text1: state.rays[index].doctorName,
                  text2: state.rays[index].raysType,
                  text3: state.rays[index].examinationDate,
                ),
              );
            },
            displayedList: state.rays,
          );
        } else if (state is GetRaysFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage, style: Styles.styleBlue25),
            ),
          );
        } else {
          if (state is DeleteRaysFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeleteRaysSuccess) {
            InfoBox.customSnackBar(context, "Item deleted successfully.");
          }
          return Skeletonizer.sliver(
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
