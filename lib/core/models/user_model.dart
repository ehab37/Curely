import 'package:curely/constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    super.imageUrl,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uId: user.uid,
      imageUrl: user.photoURL,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json[DatabaseKeys.name],
      email: json[DatabaseKeys.email],
      uId: json[DatabaseKeys.uId],
      imageUrl: json[DatabaseKeys.profileImage],
    );
  }

  factory UserModel.fromUserEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      imageUrl: user.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseKeys.name: name,
      DatabaseKeys.email: email,
      DatabaseKeys.uId: uId,
      DatabaseKeys.profileImage: imageUrl,
    };
  }
}
