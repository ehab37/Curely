import 'package:curely/features/auth/presentation/views/login_view.dart';
import 'package:curely/features/auth/presentation/views/register_view.dart';
import 'package:curely/features/auth/presentation/views/reset_password_view.dart';
import 'package:curely/features/auth/presentation/views/terms_and_conditions_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_analysis_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_medicine_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_prescription_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_rays_view.dart';
import 'package:curely/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_analysis_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_medicines_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_prescriptions_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_rays_view.dart';
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
  static const kAddMedicineView = "/addMedicineView";
  static const kAddPrescriptionView = "/addPrescriptionView";
  static const kAddRaysView = "/addRaysView";
  static const kAddAnalysisView = "/addAnalysisView";
  static const kDisplayMedicineView = "/displayMedicineView";
  static const kDisplayPrescriptionView = "/displayPrescriptionView";
  static const kDisplayRaysView = "/displayRaysView";
  static const kDisplayAnalysisView = "/displayAnalysisView";

  static final router = GoRouter(
    observers: [GoTransition.observer],
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
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
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
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
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kDashboardView,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: kAddMedicineView,
        builder: (context, state) => const AddMedicineView(),
      ),
      GoRoute(
        path: kAddPrescriptionView,
        builder: (context, state) => const AddPrescriptionView(),
      ),
      GoRoute(
        path: kAddRaysView,
        builder: (context, state) => const AddRaysView(),
      ),
      GoRoute(
        path: kAddAnalysisView,
        builder: (context, state) => const AddAnalysisView(),
      ),
      GoRoute(
        path: kDisplayMedicineView,
        builder: (context, state) => const DisplayMedicinesView(),
      ),
      GoRoute(
        path: kDisplayPrescriptionView,
        builder: (context, state) => const DisplayPrescriptionsView(),
      ),
      GoRoute(
        path: kDisplayRaysView,
        builder: (context, state) => const DisplayRaysView(),
      ),
      GoRoute(
        path: kDisplayAnalysisView,
        builder: (context, state) => const DisplayAnalysisView(),
      ),
    ],
  );
}
