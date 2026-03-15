import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';

class NoteModel {
  final String? docId;
  final String title;
  String description;
  String? createdAt;
  final bool isFavorite;

  NoteModel({
    this.docId,
    required this.title,
    required this.description,
    this.createdAt,
    required this.isFavorite,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      docId: json['docId'],
      title: json['title'],
      description: json['description'],
      createdAt: (json['createdAt'] as Timestamp).toReadableDateAndTime(),
      isFavorite: json['isFavorite'],
    );
  }

  NoteEntity toEntity() {
    return NoteEntity(
      docId: docId!,
      title: title,
      description: description,
      createdAt: createdAt,
      isFavorite: isFavorite,
    );
  }

  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      title: entity.title,
      description: entity.description,
      isFavorite: entity.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isFavorite': isFavorite,
    };
  }
}
