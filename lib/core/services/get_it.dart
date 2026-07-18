import 'package:curely/core/global_cubits/theme_cubit/theme_cubit.dart';
import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/repos/images_repo/images_repo_impl.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo_impl.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/file_downloader.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/services/firestore_services.dart';
import 'package:curely/core/services/ai_chat_service.dart';
import 'package:curely/core/services/location_service.dart';
import 'package:curely/core/services/network_manager.dart';
import 'package:curely/core/services/local_notifications_service.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:curely/core/services/supabase_storage.dart';
import 'package:curely/core/services/url_service.dart';
import 'package:curely/features/auth/data/repos/auth_repo_impl.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/dashboard/data/repos/analysis_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/medicine_notification_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/medicine_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/prescription_notifiction_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/prescription_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/rays_repo_impl.dart';
import 'package:curely/features/dashboard/domain/repos/analysis_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_notification_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:curely/features/dashboard/domain/repos/rays_repo.dart';
import 'package:curely/features/home/data/repos/home_repo_impl.dart';
import 'package:curely/features/home/domain/repos/home_repo.dart';
import 'package:curely/features/profile/data/repos/notes_repo_impl.dart';
import 'package:curely/features/profile/data/repos/profile_repo_impl.dart';
import 'package:curely/features/profile/domain/repos/notes_repo.dart';
import 'package:curely/features/profile/domain/repos/profile_repo.dart';
import 'package:curely/features/welcome/presentation/cubits/language_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerFactory<LanguageCubit>(() => LanguageCubit());
  getIt.registerFactory<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<FirebaseAuthServices>(
    () => FirebaseAuthServices(),
  );
  getIt.registerLazySingleton<DatabaseService>(() => FirestoreServices());
  getIt.registerLazySingleton<UrlService>(() => UrlService());
  getIt.registerLazySingleton<LocalNotificationsService>(
    () => LocalNotificationsService(),
  );
  getIt.registerLazySingleton<StorageServices>(() => SupabaseStorage());
  getIt.registerLazySingleton<FileDownloader>(() => FileDownloader());
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<AiChatService>(() => AiChatService());
  getIt.registerLazySingleton<UserDataRepo>(
    () => UserDataRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      userDataRepo: getIt<UserDataRepo>(),
      networkManager: getIt<NetworkManager>(),
      urlService: getIt<UrlService>(),
    ),
  );
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(
      userDataRepo: getIt<UserDataRepo>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerLazySingleton<ImagesRepo>(
    () => ImagesRepoImpl(
      storageServices: getIt<StorageServices>(),
      fileDownloader: getIt<FileDownloader>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
  getIt.registerLazySingleton<MedicineNotificationRepo>(
    () => MedicineNotificationRepoImpl(
      notificationService: getIt<LocalNotificationsService>(),
    ),
  );
  getIt.registerLazySingleton<MedicineRepo>(
    () => MedicineRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
      userDataRepo: getIt<UserDataRepo>(),
      storageServices: getIt<StorageServices>(),
    ),
  );
  getIt.registerLazySingleton<PrescriptionNotificationRepo>(
    () => PrescriptionNotificationRepoImpl(
      notificationService: getIt<LocalNotificationsService>(),
    ),
  );
  getIt.registerLazySingleton<PrescriptionRepo>(
    () => PrescriptionRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
      userDataRepo: getIt<UserDataRepo>(),
      storageServices: getIt<StorageServices>(),
    ),
  );
  getIt.registerLazySingleton<RaysRepo>(
    () => RaysRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
      userDataRepo: getIt<UserDataRepo>(),
      storageServices: getIt<StorageServices>(),
    ),
  );
  getIt.registerLazySingleton<AnalysisRepo>(
    () => AnalysisRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
      userDataRepo: getIt<UserDataRepo>(),
      storageServices: getIt<StorageServices>(),
    ),
  );
  getIt.registerLazySingleton<NotesRepo>(
    () => NotesRepoImpl(
      databaseService: getIt<DatabaseService>(),
      networkManager: getIt<NetworkManager>(),
      userDataRepo: getIt<UserDataRepo>(),
    ),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      urlService: getIt<UrlService>(),
      locationService: getIt<LocationService>(),
      geminiChatService: getIt<AiChatService>(),
      networkManager: getIt<NetworkManager>(),
    ),
  );
}
