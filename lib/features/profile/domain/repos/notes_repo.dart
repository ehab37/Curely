import 'package:curely/core/error/failures.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotesRepo {
  Future<Either<Failure, void>> addNote({
    required NoteEntity note,
    required String profileId,
  });

  Future<Either<Failure, List<NoteEntity>>> getNotes({
    String? searchText,
    required String profileId,
  });

  Future<Either<Failure, List<NoteEntity>>> getFavoriteNotes({
    required String profileId,
  });

  Future<Either<Failure, void>> deleteNote({
    required String docId,
    required String profileId,
  });

  Future<Either<Failure, void>> updateNote({
    required NoteEntity note,
    required String profileId,
  });
}
