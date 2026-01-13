import 'dart:io';

class UserEntity {
  final String email;
  final String name;
  final String uId;
  final File? image;
  String? imageUrl;

  UserEntity({
    required this.email,
    required this.name,
    required this.uId,
    this.image,
    this.imageUrl,
  });
}
