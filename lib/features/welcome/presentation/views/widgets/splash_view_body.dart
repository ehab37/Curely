import 'package:curely/core/utils/app_router.dart';
import 'package:curely/core/utils/assets.dart';
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
          child: Image.asset(AssetsData.kSplashLogo),
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
    Future.delayed(const Duration(seconds: 3), () {
      mounted ? GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView) : null;
    });
  }
}
