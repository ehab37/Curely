import 'package:curely/core/repos/images_repo/images_repo.dart';
import 'package:curely/core/repos/images_repo/images_repo_impl.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/fire_storage.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/services/firestore_services.dart';
import 'package:curely/core/services/storage_services.dart';
import 'package:curely/features/auth/data/repos/auth_repo_impl.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:curely/features/dashboard/data/repos/medicine_repo_impl.dart';
import 'package:curely/features/dashboard/data/repos/prescription_repo_impl.dart';
import 'package:curely/features/dashboard/domain/repos/medicine_repo.dart';
import 'package:curely/features/dashboard/domain/repos/prescription_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreServices());
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageServices: getIt<StorageServices>()),
  );
  getIt.registerSingleton<MedicineRepo>(
    MedicineRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<PrescriptionRepo>(
    PrescriptionRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
