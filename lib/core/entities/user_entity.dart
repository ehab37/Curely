import 'dart:io';

class UserEntity {
  final String email;
  String name;
  final String uId;
  File? image;
  String? imageUrl;

  UserEntity({
    required this.email,
    required this.name,
    required this.uId,
    this.image,
    this.imageUrl,
  });
}
