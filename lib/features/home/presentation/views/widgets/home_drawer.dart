import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/cubits/logout_user_cubit.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.bottomNavigationKey});

  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  @override
  Widget build(BuildContext context) {
    final userData = getFinalUserData();
    return BlocConsumer<LogoutUserCubit, LogoutUserState>(
      listener: (context, state) {
        if (state is LogoutUserSuccess) {
          GoRouter.of(context)
              .pushReplacement(AppRoutesConstants.kWelcomeView)
              .then(
                (value) => CacheHelper.removeData(key: CacheConstants.user),
              );
        } else if (state is LogoutUserFailure) {
          InfoBox.customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogoutUserLoading ? true : false,
          child: Drawer(
            width: 250,
            child: Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.solidCircleUser),
                      10.horizontalSpacing,
                      Text(
                        userData.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text("Dashboard"),
                  leading: const Icon(Icons.dashboard),
                  onTap: () {
                    bottomNavigationKey.currentState?.setPage(1);
                  },
                ),
                ListTile(
                  title: Text("Reminder"),
                  leading: Icon(Icons.alarm),
                  onTap: () {
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
                    bottomNavigationKey.currentState?.setPage(3);
                  },
                ),
                ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.logout_rounded),
                  onTap: () async {
                    await context.read<LogoutUserCubit>().logoutUser();
                    context.mounted ? Scaffold.of(context).closeDrawer() : null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
