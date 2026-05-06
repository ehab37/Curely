class NoteEntity {
  final String? docId;
  final String title;
  String description;
  final String? createdAt;
  bool isFavorite;

  NoteEntity({
    this.docId,
    required this.title,
    required this.description,
    this.createdAt,
    this.isFavorite = false,
  });
}
