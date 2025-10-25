import 'package:curely/constants.dart';
import 'package:curely/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uId: user.uid,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[DatabaseKeys.name],
      email: json[DatabaseKeys.email],
      uId: json[DatabaseKeys.uId],
    );
  }
}
