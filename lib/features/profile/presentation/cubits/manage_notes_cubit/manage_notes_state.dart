part of 'manage_notes_cubit.dart';

@immutable
sealed class ManageNotesState {}

final class ManageNotesInitial extends ManageNotesState {}

final class ManageNotesLoading extends ManageNotesState {}

final class AddNoteFailure extends ManageNotesState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}

final class GetNotesFailure extends ManageNotesState {
  final String errMessage;

  GetNotesFailure(this.errMessage);
}

final class UpdateNoteFailure extends ManageNotesState {
  final String errMessage;

  UpdateNoteFailure(this.errMessage);
}

final class DeleteNoteFailure extends ManageNotesState {
  final String errMessage;

  DeleteNoteFailure(this.errMessage);
}

final class AddNoteSuccess extends ManageNotesState {}

final class GetNotesSuccess extends ManageNotesState {
  final List<NoteEntity> notes;

  GetNotesSuccess(this.notes);
}

final class UpdateNoteSuccess extends ManageNotesState {}

final class DeleteNoteSuccess extends ManageNotesState {}
