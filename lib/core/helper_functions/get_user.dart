import 'dart:convert';
import 'package:curely/core/constants/cache_constants.dart';
import 'package:curely/core/services/cache_helper.dart';
import 'package:curely/core/models/user_model.dart';
import 'package:curely/core/entities/user_entity.dart';

UserEntity getFinalUserData() {
  var data = CacheHelper.getData(key: CacheConstants.user);
  UserEntity userEntity = UserModel.fromJson(jsonDecode(data));
  return userEntity;
}
