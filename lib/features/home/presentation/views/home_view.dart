import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/global_cubits/logout_cubit/logout_user_cubit.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/image_input/cached_image_widget.dart';
import 'package:curely/core/helpers/extensions.dart';
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
    final UserEntity user = getIt<UserDataRepo>().getUserDataLocally();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: AppColors.primary,
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
            5.verticalSpacing,
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
