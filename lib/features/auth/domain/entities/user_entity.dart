import 'package:curely/constants.dart';

class UserEntity {
  final String email;
  final String name;
  final String uId;

  UserEntity({required this.email, required this.name, required this.uId});

  toMap() {
    return {
      DatabaseKeys.name: name,
      DatabaseKeys.email: email,
      DatabaseKeys.uId: uId,
    };
  }
}
