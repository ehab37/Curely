import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/repos/images_repo/images_repo_impl.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo_impl.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/fire_storage.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/services/firestore_services.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/core/services/notification_service.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:curely/core/services/url_services.dart';
import 'package:curely/features/auth/data/repos/auth_repo_impl.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/dashboard/data/repos/analysis_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/medicine_notification_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/medicine_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/prescription_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/rays_repo_impl.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/home/data/repos/home_repo_impl.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:curely/features/profile/data/repos/profile_repo_impl.dart';
import 'package:curely/features/profile/domain/repos/profile_repo.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<LanguageCubit>(LanguageCubit());
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreServices());
  getIt.registerSingleton<UrlServices>(UrlServices());
  getIt.registerSingleton<NotificationService>(NotificationService());
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<NetworkManager>(NetworkManager());
  getIt.registerSingleton<UserDataRepo>(
    UserDataRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      userDataRepo: getIt<UserDataRepo>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(
      userDataRepo: getIt<UserDataRepo>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(
      storageServices: getIt<StorageServices>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<EditProfileCubit>(
    EditProfileCubit(
      profileRepo: getIt<ProfileRepo>(),
      imagesRepo: getIt<ImagesRepo>(),
    ),
  );
  getIt.registerSingleton<MedicineNotificationRepo>(
    MedicineNotificationRepoImpl(
      notificationService: getIt<NotificationService>(),
    ),
  );
  getIt.registerSingleton<MedicineRepo>(
    MedicineRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<PrescriptionRepo>(
    PrescriptionRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<RaysRepo>(
    RaysRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<AnalysisRepo>(
    AnalysisRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(urlServices: getIt<UrlServices>()),
  );
}
