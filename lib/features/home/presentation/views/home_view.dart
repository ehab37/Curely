import 'package:curely/core/global_cubits/logout_cubit/logout_user_cubit.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/build_home_app_bar.dart';
import 'widgets/home_drawer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.bottomNavigationKey});

  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(context),
      drawer: BlocProvider(
        create: (context) => LogoutUserCubit(authRepo: getIt<AuthRepo>()),
        child: HomeDrawer(bottomNavigationKey: bottomNavigationKey),
      ),
      body: const HomeViewBody(),
    );
  }
}
