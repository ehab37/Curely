import 'dart:io';

class UserEntity {
  final String email;
  String name;
  final String uId;
  String? blood;
  int? height;
  int? weight;
  String? dateOfBirth;
  File? image;
  String? imageUrl;

  UserEntity({
    required this.email,
    required this.name,
    required this.uId,
    this.blood,
    this.height,
    this.weight,
    this.dateOfBirth,
    this.image,
    this.imageUrl,
  });
}
