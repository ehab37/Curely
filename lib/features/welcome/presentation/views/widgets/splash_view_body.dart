import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/assets_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    initFadingAnimation();
    navigateHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => FadeTransition(
          opacity: animation,
          child: Image.asset(AssetsConstants.kSplashLogo),
        ),
      ),
    );
  }

  void initFadingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  void navigateHome() {
    final bool isOnBoardingViewSeen = CacheHelper.getData(
      key: CacheConstants.kIsOnBoardingViewSeen,
    );
    final bool isUserLogin = FirebaseAuthServices.isUserLoggedIn();
    Future.delayed(const Duration(seconds: 3), () {
      mounted
          ? isOnBoardingViewSeen
                ? isUserLogin
                      ? GoRouter.of(
                          context,
                        ).pushReplacement(AppRoutesConstants.kMainView)
                      : GoRouter.of(
                          context,
                        ).pushReplacement(AppRoutesConstants.kWelcomeView)
                : GoRouter.of(
                    context,
                  ).pushReplacement(AppRoutesConstants.kOnBoardingView)
          : null;
    });
  }
}
