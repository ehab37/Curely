import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidCircleUser),
                SizedBox(width: 10),
                Text(
                  getFinalUserData().name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Dashboard"),
            leading: const Icon(Icons.dashboard),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kDashboardView);
            },
          ),
          const ListTile(title: Text("Reminder"), leading: Icon(Icons.alarm)),
          ListTile(
            title: const Text("Profile"),
            leading: const Icon(FontAwesomeIcons.circleUser),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProfileView);
            },
          ),
          ListTile(
            title: const Text("Log out"),
            leading: const Icon(Icons.logout_rounded),
            onTap: () async {
              await FirebaseAuthServices().logoutUser();
              GoRouter.of(context).pushReplacement(AppRouter.kWelcomeView);
              // CacheHelper.removeData(key: kIsUserLogin);
              // BlocProvider.of<SignOutCubit>(context).logOut();
            },
          ),
        ],
      ),
    );
  }
}
