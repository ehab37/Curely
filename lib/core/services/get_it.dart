import 'package:curely/core/services/database_service.dart';
import 'package:curely/core/services/firebase_auth_services.dart';
import 'package:curely/core/services/firestore_services.dart';
import 'package:curely/features/auth/data/repos/auth_repo_impl.dart';
import 'package:curely/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseService>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
