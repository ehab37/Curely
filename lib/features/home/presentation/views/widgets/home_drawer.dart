import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/global_cubits/logout_cubit/logout_user_cubit.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_progress_hud.dart';
import 'package:curely/core/widgets/image_input/profile_cached_image_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.bottomNavigationKey});

  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  @override
  Widget build(BuildContext context) {
    final UserEntity user = getIt<UserDataRepo>().getUserDataLocally();
    return BlocConsumer<LogoutUserCubit, LogoutUserState>(
      listener: (context, state) {
        if (state is LogoutUserSuccess) {
          InfoBox.errorFloatingBox(context, "Logged out successfully.");
          GoRouter.of(context).pushReplacement(AppRoutesConstants.kLoginView);
        } else if (state is LogoutUserFailure) {
          InfoBox.errorFloatingBox(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LogoutUserLoading ? true : false,
          child: Drawer(
            width: 250,
            child: SafeArea(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      user.name,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(user.email, overflow: TextOverflow.ellipsis),
                    leading: ProfileCachedImageWidget(
                      imageUrl: user.imageUrl,
                      isProfile: false,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: const Text("Dashboard"),
                    leading: const Icon(Icons.dashboard_outlined),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      bottomNavigationKey.currentState?.setPage(1);
                    },
                  ),
                  ListTile(
                    title: Text("Reminder"),
                    leading: Icon(Icons.alarm),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      GoRouter.of(context).push(
                        AppRoutesConstants.kDisplayMedicineView,
                        extra: true,
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Profile"),
                    leading: const Icon(FontAwesomeIcons.circleUser),
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      bottomNavigationKey.currentState?.setPage(4);
                    },
                  ),
                  Spacer(),
                  ListTile(
                    title: const Text("Log out"),
                    leading: SvgPicture.asset(
                      AssetsConstants.kLogout,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () async {
                      await context.read<LogoutUserCubit>().logoutUser();
                      context.mounted
                          ? Scaffold.of(context).closeDrawer()
                          : null;
                    },
                  ),
                  16.verticalSpacing,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
