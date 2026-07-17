import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/domain/repos/notes_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_notes_state.dart';

class ManageNotesCubit extends Cubit<ManageNotesState> {
  ManageNotesCubit({required this.notesRepo}) : super(ManageNotesInitial());
  final NotesRepo notesRepo;

  Future<void> addNote({required NoteEntity note}) async {
    emit(ManageNotesLoading());
    var result = await notesRepo.addNote(note: note);
    result.fold(
      (failure) {
        emit(AddNoteFailure(failure.errMessage));
        getNotes();
      },
      (success) {
        emit(AddNoteSuccess());
        getNotes();
      },
    );
  }

  Future<void> getNotes({
    String? searchText,
    bool isFavoriteView = false,
  }) async {
    emit(ManageNotesLoading());
    var result = isFavoriteView
        ? await notesRepo.getFavoriteNotes()
        : await notesRepo.getNotes(searchText: searchText);
    result.fold(
      (failure) {
        emit(GetNotesFailure(failure.errMessage));
      },
      (notes) {
        emit(GetNotesSuccess(notes));
      },
    );
  }

  Future<void> updateNote({required NoteEntity note}) async {
    emit(ManageNotesLoading());
    var result = await notesRepo.updateNote(note: note);
    result.fold(
      (failure) {
        emit(UpdateNoteFailure(failure.errMessage));
        getNotes();
      },
      (success) {
        emit(UpdateNoteSuccess());
        getNotes();
      },
    );
  }

  Future<void> deleteNote({required String docId}) async {
    emit(ManageNotesLoading());
    var result = await notesRepo.deleteNote(docId: docId);
    result.fold(
      (failure) {
        emit(DeleteNoteFailure(failure.errMessage));
        getNotes();
      },
      (notes) {
        emit(DeleteNoteSuccess());
        getNotes();
      },
    );
  }
}
