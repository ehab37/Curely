import 'package:curely/constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        return Drawer(
          width: 250,
          child: Column(
            children: [
              const DrawerHeader(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.solidCircleUser),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ehab Mostafa",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text("Dashboard"),
                leading: const Icon(Icons.dashboard),
                onTap: (){
                  // GoRouter.of(context).push(AppRouter.dashboardView);
                },
              ),
              const ListTile(
                title: Text("Reminder"),
                leading: Icon(Icons.alarm),
              ),
              ListTile(
                title: const Text("Profile"),
                leading: const Icon(FontAwesomeIcons.circleUser),
                onTap: (){
                  // GoRouter.of(context).push(AppRouter.profileView);
                },
              ),
              ListTile(
                title: const Text("Log out"),
                leading: const Icon(Icons.logout_rounded),
                onTap: () async {
                  await GoogleSignIn.instance.signOut();
                  await FirebaseAuth.instance.signOut();
                  GoRouter.of(context).pushReplacement(AppRouter.kWelcomeView);
                  CacheHelper.removeData(key: kIsUserLogin);
                  // BlocProvider.of<SignOutCubit>(context).logOut();
                },
              ),
            ],
          ),
    );
  }
}
