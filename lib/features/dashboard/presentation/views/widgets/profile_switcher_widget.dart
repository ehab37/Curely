import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/global_cubits/active_profile_cubit/active_profile_cubit.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/custom_loading_indicator.dart';
import 'package:curely/features/dashboard/presentation/views/widgets/profile_icon_and_name.dart';
import 'package:curely/features/profile/presentation/cubits/manage_dependents_cubit/manage_dependents_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileSwitcherWidget extends StatelessWidget {
  const ProfileSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final activeProfileCubit = context.watch<ActiveProfileCubit>();
    final mainUser = getIt<UserDataRepo>().getUserDataLocally();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("family_profiles"),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        8.verticalSpacing,
        BlocBuilder<ManageDependentsCubit, ManageDependentsState>(
          builder: (context, state) {
            List<Map<String, String>> profiles = [
              {'id': mainUser.uId, 'name': context.tr("me")},
            ];

            if (state is GetDependentsSuccess) {
              profiles.addAll(
                state.dependents
                    .map((d) => {'id': d.docId!, 'name': d.name})
                    .toList(),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...profiles.map((profile) {
                    final bool isActive =
                        activeProfileCubit.activeProfileId == profile['id'];

                    return GestureDetector(
                      onTap: () {
                        if (!isActive) {
                          activeProfileCubit.switchProfile(
                            id: profile['id']!,
                            name: profile['name']!,
                          );
                        }
                      },
                      child: ProfileIconAndName(
                        isActive: isActive,
                        profileName: profile['name']!,
                      ),
                    );
                  }),
                  state is ManageDependentsLoading
                      ? CustomLoadingIndicator()
                      : GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(
                              AppRoutesConstants.kManageDependentsView,
                              extra: context.read<ManageDependentsCubit>(),
                            );
                          },
                          child: ProfileIconAndName(
                            isActive: false,
                            profileName: context.tr("add_profile"),
                            isAddButton: true,
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
