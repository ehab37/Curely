import 'package:curely/features/auth/presentation/views/login_view.dart';
import 'package:curely/features/auth/presentation/views/register_view.dart';
import 'package:curely/features/auth/presentation/views/reset_password_view.dart';
import 'package:curely/features/auth/presentation/views/terms_and_conditions_view.dart';
import 'package:curely/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:curely/features/home/presentation/views/home_view.dart';
import 'package:curely/features/profile/presentation/views/profile_view.dart';
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
  static const kResetPasswordView = "/resetPasswordView";
  static const kTermsAndConditionsView = "/termsAndConditionsView";
  static const kHomeView = "/homeView";
  static const kProfileView = "/profileView";
  static const kDashboardView = "/dashboardView";

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
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kTermsAndConditionsView,
        builder: (context, state) => const TermsAndConditionsView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kDashboardView,
        builder: (context, state) => const DashboardView(),
      ),
    ],
  );
}
