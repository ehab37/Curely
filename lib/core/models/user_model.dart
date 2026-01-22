import 'package:curely/constants.dart';
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
      name: json[DatabaseKeys.name],
      email: json[DatabaseKeys.email],
      uId: json[DatabaseKeys.uId],
      blood: json['blood'],
      height: json['height'],
      weight: json['weight'],
      dateOfBirth: json['dateOfBirth'],
      imageUrl: json[DatabaseKeys.profileImage],
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
      DatabaseKeys.name: name,
      DatabaseKeys.email: email,
      DatabaseKeys.uId: uId,
      'blood': blood,
      'height': height,
      'weight': weight,
      'dateOfBirth': dateOfBirth,
      DatabaseKeys.profileImage: imageUrl,
    };
  }
}
