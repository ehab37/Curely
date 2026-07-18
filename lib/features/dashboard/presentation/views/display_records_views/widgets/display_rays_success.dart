import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'displayed_item.dart';
import 'displayed_list_view.dart';
import 'records_dismissible_widget.dart';

class DisplayRaysSuccess extends StatelessWidget {
  const DisplayRaysSuccess({super.key, required this.raysList});

  final List<RaysEntity> raysList;

  @override
  Widget build(BuildContext context) {
    return DisplayedListView(
      itemBuilder: (context, index) {
        return RecordsDismissibleWidget(
          recordKey: raysList[index].docId!,
          onDismissed: (direction) {
            context.read<ManageRaysCubit>().deleteRays(rays: raysList[index]);
          },
          content: GestureDetector(
            onTap: () {
              ManageRaysCubit cubit = context.read<ManageRaysCubit>();
              GoRouter.of(context).push(
                AppRoutesConstants.kRaysDetailsView,
                extra: [raysList[index], cubit],
              );
            },
            child: DisplayedItem(
              imageUrl: raysList[index].imageUrls![0],
              text1: raysList[index].doctorName,
              text2: context.tr(raysList[index].raysType),
              text3: raysList[index].examinationDate,
              isFavorite: raysList[index].isFavorite,
              onTap: () {
                context.read<ManageRaysCubit>().updateRays(
                  rays: raysList[index]
                    ..isFavorite = !raysList[index].isFavorite,
                );
              },
            ),
          ),
        );
      },
      displayedList: raysList,
    );
  }
}
