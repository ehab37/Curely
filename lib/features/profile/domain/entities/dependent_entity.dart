import 'dart:io';

const List<String> relationshipsList = [
  'son',
  'daughter',
  'father',
  'mother',
  'husband',
  'wife',
  'other',
];

class DependentEntity {
  String? docId;
  String name;
  String relationship;
  String? blood;
  int? height;
  int? weight;
  String? dateOfBirth;
  File? image;
  String? imageUrl;

  DependentEntity({
    this.docId,
    required this.name,
    required this.relationship,
    this.blood,
    this.height,
    this.weight,
    this.dateOfBirth,
    this.image,
    this.imageUrl,
  });
}
