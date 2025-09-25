
import 'package:curely/features/welcome/presentation/views/on_boarding_view.dart';
import 'package:curely/features/welcome/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kOnBoardingView = "/onBoardingView";
  static const welcomeView = "/welcomeView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onBoardingView',
        builder: (context, state) => const OnBoardingView(),
      ),

    ],
  );
}
