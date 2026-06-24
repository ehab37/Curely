import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/features/dashboard/presentation/views/image_view.dart';
import 'package:curely/features/auth/presentation/views/login_view.dart';
import 'package:curely/features/auth/presentation/views/register_view.dart';
import 'package:curely/features/auth/presentation/views/reset_password_view.dart';
import 'package:curely/features/auth/presentation/views/terms_and_conditions_view.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_analysis_cubit/manage_analysis_cubit.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_prescriptions_cubit/manage_prescriptions_cubit.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_rays_cubit/manage_rays_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_analysis_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_medicine_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_prescription_view.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/add_rays_view.dart';
import 'package:curely/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/analysis_details_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_analysis_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_medicines_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_prescriptions_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/display_rays_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/medicine_details_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/prescription_details_view.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/rays_details_view.dart';
import 'package:curely/features/home/presentation/views/doctor_ai_view.dart';
import 'package:curely/features/home/presentation/views/main_view.dart';
import 'package:curely/features/home/presentation/views/search_view.dart';
import 'package:curely/features/profile/presentation/views/notes_view.dart';
import 'package:curely/features/profile/presentation/views/profile_view.dart';
import 'package:curely/features/welcome/presentation/views/language_view.dart';
import 'package:curely/features/welcome/presentation/views/on_boarding_view.dart';
import 'package:curely/features/welcome/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

abstract class AppRouter {
  static Widget initialView() {
    final bool isOnBoardingViewSeen = CacheHelper.getData(
      key: CacheConstants.kIsOnBoardingViewSeen,
    );
    final bool isUserLogin = FirebaseAuthServices.isUserLoggedIn();
    return isOnBoardingViewSeen
        ? isUserLogin
              ? MainView()
              : WelcomeView()
        : OnBoardingView();
  }

  static final router = GoRouter(
    observers: [GoTransition.observer],
    routes: [
      GoRoute(path: '/', builder: (context, state) => initialView()),
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
          bool isFavoriteView = false;
          if (state.extra != null) {
            var data = state.extra as Map<String, bool>;
            if (data['isReminderView'] as bool) {
              isReminderView = true;
            }
            if (data['isFavoriteView'] as bool) {
              isFavoriteView = true;
            }
          }
          return DisplayMedicinesView(
            isRemindersView: isReminderView,
            isFavoriteView: isFavoriteView,
          );
        },
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayPrescriptionView,
        builder: (context, state) {
          bool isFavoriteView = false;
          if (state.extra != null) {
            isFavoriteView = true;
          }
          return DisplayPrescriptionsView(isFavoriteView: isFavoriteView);
        },
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayRaysView,
        builder: (context, state) {
          bool isFavoriteView = false;
          if (state.extra != null) {
            isFavoriteView = true;
          }
          return DisplayRaysView(isFavoriteView: isFavoriteView);
        },
      ),
      GoRoute(
        path: AppRoutesConstants.kDisplayAnalysisView,
        builder: (context, state) {
          bool isFavoriteView = false;
          if (state.extra != null) {
            isFavoriteView = true;
          }
          return DisplayAnalysisView(isFavoriteView: isFavoriteView);
        },
      ),
      GoRoute(
        path: AppRoutesConstants.kMedicineDetailsView,
        builder: (context, state) => BlocProvider.value(
          value: (state.extra! as List)[1] as ManageMedicinesCubit,
          child: MedicineDetailsView(
            medicine: (state.extra! as List)[0] as MedicineEntity,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutesConstants.kPrescriptionDetailsView,
        builder: (context, state) => BlocProvider.value(
          value: (state.extra! as List)[1] as ManagePrescriptionsCubit,
          child: PrescriptionDetailsView(
            prescription: (state.extra! as List)[0] as PrescriptionEntity,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutesConstants.kRaysDetailsView,
        builder: (context, state) => BlocProvider.value(
          value: (state.extra! as List)[1] as ManageRaysCubit,
          child: RaysDetailsView(rays: (state.extra! as List)[0] as RaysEntity),
        ),
      ),
      GoRoute(
        path: AppRoutesConstants.kAnalysisDetailsView,
        builder: (context, state) => BlocProvider.value(
          value: (state.extra! as List)[1] as ManageAnalysisCubit,
          child: AnalysisDetailsView(
            analysis: (state.extra! as List)[0] as AnalysisEntity,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutesConstants.kImageView,
        builder: (context, state) => ImageView(imageUrl: state.extra as String),
      ),
      GoRoute(
        path: AppRoutesConstants.kNotesView,
        builder: (context, state) {
          bool isFavoriteView = false;
          if (state.extra != null) {
            isFavoriteView = true;
          }
          return NotesView(isFavoriteView: isFavoriteView);
        },
      ),
      GoRoute(
        path: AppRoutesConstants.kDoctorAiView,
        builder: (context, state) => DoctorAiView(),
      ),
    ],
  );
}
