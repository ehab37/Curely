import 'package:curely/core/error/failures.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepoImpl implements ProfileRepo {
  final UserDataRepo userDataRepo;

  ProfileRepoImpl({required this.userDataRepo});

  @override
  Future<Either<Failure, void>> editUserData({required UserEntity user}) async {
    try {
      await userDataRepo.editUserData(user: user);
      await userDataRepo.saveUserData(user: user);
      return Right(null);
    } on FirebaseException catch (e) {
      return Left(AuthExceptionHandler.fromAuthException(e));
    } catch (e) {
      return Left(OtherErrors.fromOtherErrors(e));
    }
  }
}
