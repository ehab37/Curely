import 'package:curely/constants.dart';
import 'package:curely/core/cubits/logout_user_cubit.dart';
import 'package:curely/core/helper_functions/get_user.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/image_input/cached_image_widget.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:curely/features/home/presentation/views/widgets/home_drawer.dart';
import 'package:curely/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.bottomNavigationKey});

  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  @override
  Widget build(BuildContext context) {
    final user = getFinalUserData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: kNavyColor,
        leading: Builder(
          builder: (context) => CustomIconButton(
            icon: FontAwesomeIcons.bars,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CachedImageWidget(imageUrl: user.imageUrl, isProfile: false),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello", style: Styles.style18),
            SizedBox(height: 5),
            Text(user.name, style: Styles.styleWhite25),
          ],
        ),
      ),
      drawer: BlocProvider(
        create: (context) => LogoutUserCubit(authRepo: getIt<AuthRepo>()),
        child: HomeDrawer(bottomNavigationKey: bottomNavigationKey),
      ),
      body: const HomeViewBody(),
    );
  }
}
