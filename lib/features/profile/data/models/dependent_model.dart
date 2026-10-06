import 'package:curely/core/constants/database_constants.dart';
import 'package:curely/features/profile/domain/entities/dependent_entity.dart';

class DependentModel extends DependentEntity {
  DependentModel({
    required super.docId,
    required super.name,
    required super.relationship,
    super.blood,
    super.height,
    super.weight,
    super.dateOfBirth,
    super.imageUrl,
  });

  factory DependentModel.fromJson(Map<String, dynamic> json) {
    return DependentModel(
      docId: json[DatabaseConstants.uId],
      name: json[DatabaseConstants.name],
      relationship: json[DatabaseConstants.relationship],
      blood: json[DatabaseConstants.blood],
      height: json[DatabaseConstants.height],
      weight: json[DatabaseConstants.weight],
      dateOfBirth: json[DatabaseConstants.dateOfBirth],
      imageUrl: json[DatabaseConstants.profileImage],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConstants.name: name,
      DatabaseConstants.relationship: relationship,
      DatabaseConstants.blood: blood,
      DatabaseConstants.height: height,
      DatabaseConstants.weight: weight,
      DatabaseConstants.dateOfBirth: dateOfBirth,
      DatabaseConstants.profileImage: imageUrl,
    };
  }

  factory DependentModel.fromEntity(DependentEntity entity) {
    return DependentModel(
      docId: entity.docId,
      name: entity.name,
      relationship: entity.relationship,
      blood: entity.blood,
      height: entity.height,
      weight: entity.weight,
      dateOfBirth: entity.dateOfBirth,
      imageUrl: entity.imageUrl,
    );
  }
}
