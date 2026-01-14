import 'package:curely/core/entities/user_entity.dart';

abstract class UserDataRepo {
  Future<void> addUserData({required UserEntity user});

  Future<void> editUserData({required UserEntity user});

  Future<void> saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uId});

  Future<bool> checkIfDataExists({required String docId});
}
