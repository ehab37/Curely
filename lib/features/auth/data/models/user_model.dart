import 'package:curely/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.number,
    required super.uId,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      number: user.phoneNumber ?? "",
      uId: user.uid,
    );
  }
}
