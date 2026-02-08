import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    super.blood,
    super.height,
    super.weight,
    super.dateOfBirth,
    super.imageUrl,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[DatabaseConstants.name],
      email: json[DatabaseConstants.email],
      uId: json[DatabaseConstants.uId],
      blood: json[DatabaseConstants.blood],
      height: json[DatabaseConstants.height],
      weight: json[DatabaseConstants.weight],
      dateOfBirth: json[DatabaseConstants.dateOfBirth],
      imageUrl: json[DatabaseConstants.profileImage],
    );
  }

  factory UserModel.fromUserEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      blood: user.blood,
      height: user.height,
      weight: user.weight,
      dateOfBirth: user.dateOfBirth,
      imageUrl: user.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConstants.name: name,
      DatabaseConstants.email: email,
      DatabaseConstants.uId: uId,
      DatabaseConstants.blood: blood,
      DatabaseConstants.height: height,
      DatabaseConstants.weight: weight,
      DatabaseConstants.dateOfBirth: dateOfBirth,
      DatabaseConstants.profileImage: imageUrl,
    };
  }
}
