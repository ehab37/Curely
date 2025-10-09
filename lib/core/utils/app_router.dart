import 'package:curely/features/auth/presentation/views/login_view.dart';
import 'package:curely/features/auth/presentation/views/register_view.dart';
import 'package:curely/features/welcome/presentation/views/language_view.dart';
import 'package:curely/features/welcome/presentation/views/on_boarding_view.dart';
import 'package:curely/features/welcome/presentation/views/splash_view.dart';
import 'package:curely/features/welcome/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';


abstract class AppRouter {
  static const kLanguageView = "/languageView";
  static const kOnBoardingView = "/onBoardingView";
  static const kWelcomeView = "/welcomeView";
  static const kLoginView = "/loginView";
  static const kRegisterView = "/registerView";

  static final router = GoRouter(
    observers: [GoTransition.observer],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLanguageView,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
