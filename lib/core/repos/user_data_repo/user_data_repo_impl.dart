import 'dart:convert';
import 'package:curely/constants.dart';
import 'package:curely/core/repos/user_data_repo/user_data_repo.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/services/database_service.dart';
import 'package:curely/features/auth/data/models/user_model.dart';
import 'package:curely/features/auth/domain/entities/user_entity.dart';

class UserDataRepoImpl implements UserDataRepo {
  final DatabaseService databaseService;

  const UserDataRepoImpl({required this.databaseService});

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: DatabaseKeys.users,
      data: UserModel.fromUserEntity(user).toMap(),
      docId: user.uId,
    );
  }

  @override
  Future<void> editUserData({required UserEntity user}) async {
    await databaseService.updateData(
      path: DatabaseKeys.users,
      docId: user.uId,
      data: UserModel.fromUserEntity(user).toMap(),
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    Map<String, dynamic> data = await databaseService.getData(
      path: DatabaseKeys.users,
      docId: uId,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    String userData = jsonEncode(UserModel.fromUserEntity(user).toMap());
    await CacheHelper.saveData(key: DatabaseKeys.users, value: userData);
  }

  @override
  Future<bool> checkIfDataExists({required String docId}) async {
    var value = await databaseService.checkIfDataExists(
      path: DatabaseKeys.users,
      docId: docId,
    );
    return value;
  }
}
