import 'package:curely/core/entities/user_entity.dart';

abstract class UserDataRepo {
  Future<void> addUserData({required UserEntity user});

  Future<void> editUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uId});

  Future<void> deleteUserData({required String uId});

  Future<void> saveUserDataLocally({required UserEntity user});

  UserEntity getUserDataLocally();

  Future<void> deleteUserDataLocally();

  Future<bool> checkIfDataExists({required String docId});
}
