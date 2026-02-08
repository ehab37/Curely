import 'package:curely/core/constants/app_routes_constant.dart';
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
import 'package:curely/features/home/presentation/views/main_view.dart';
import 'package:curely/features/home/presentation/views/search_view.dart';
import 'package:curely/features/profile/presentation/views/profile_view.dart';
import 'package:curely/features/welcome/presentation/views/language_view.dart';
import 'package:curely/features/welcome/presentation/views/on_boarding_view.dart';
import 'package:curely/features/welcome/presentation/views/splash_view.dart';
import 'package:curely/features/welcome/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

abstract class AppRouter {
  static final router = GoRouter(
    observers: [GoTransition.observer],
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: AppRoutesConstants.kLanguageView,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kTermsAndConditionsView,
        builder: (context, state) => const TermsAndConditionsView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kMainView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kDashboardView,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kAddMedicineView,
        builder: (context, state) => const AddMedicineView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kAddPrescriptionView,
        builder: (context, state) => const AddPrescriptionView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kAddRaysView,
        builder: (context, state) => const AddRaysView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kAddAnalysisView,
        builder: (context, state) => const AddAnalysisView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayMedicineView,
        builder: (context, state) {
          bool isReminderView = false;
          if (state.extra != null) {
            isReminderView = true;
          }
          return DisplayMedicinesView(isRemindersView: isReminderView);
        },
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayPrescriptionView,
        builder: (context, state) => const DisplayPrescriptionsView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayRaysView,
        builder: (context, state) => const DisplayRaysView(),
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayAnalysisView,
        builder: (context, state) => const DisplayAnalysisView(),
      ),
    ],
  );
}
