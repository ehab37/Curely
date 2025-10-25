import 'package:curely/constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        onPressed: () async {
          await GoogleSignIn.instance.signOut();
          await FirebaseAuth.instance.signOut();
          GoRouter.of(context).pushReplacement(AppRouter.kWelcomeView);
          CacheHelper.removeData(key: kIsUserLogin);
        },
        backgroundColor: kNavyColor,
        child: Text("Logout"),
      ),
    );
  }
}
