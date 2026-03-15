import 'package:curely/core/error/failures.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotesRepo {
  Future<Either<Failure, void>> addNote({required NoteEntity note});

  Future<Either<Failure, List<NoteEntity>>> getNotes({String? searchText});

  Future<Either<Failure, List<NoteEntity>>> getFavoriteNotes();

  Future<Either<Failure, void>> deleteNote({required String docId});

  Future<Either<Failure, void>> updateNote({required NoteEntity note});
}
