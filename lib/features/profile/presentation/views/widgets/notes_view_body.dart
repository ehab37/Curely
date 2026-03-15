import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/records_dismissible_widget.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/notes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'edit_note.dart';
import 'note_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    super.key,
    required this.isFavoriteView,
    this.searchText,
  });

  final bool isFavoriteView;
  final String? searchText;

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    if (widget.isFavoriteView) {
      context.read<ManageNotesCubit>().isFavoriteView = true;
    }
    context.read<ManageNotesCubit>().getNotes(searchText: widget.searchText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageNotesCubit, ManageNotesState>(
      builder: (context, state) {
        if (state is GetNotesSuccess) {
          if (state.notes.isEmpty) {
            return Center(
              child: Text(
                widget.isFavoriteView
                    ? "NO Favorite Notes added yet!..."
                    : "NO Notes added yet!...",
                style: Styles.styleBlue25,
              ),
            );
          }
          return NotesListView(
            notesList: state.notes,
            itemBuilder: (context, index) {
              return RecordsDismissibleWidget(
                recordKey: state.notes[index].docId!,
                onDismissed: (direction) {
                  context.read<ManageNotesCubit>().deleteNote(
                    docId: state.notes[index].docId!,
                  );
                },
                content: GestureDetector(
                  onTap: () {
                    ManageNotesCubit cubit = context.read<ManageNotesCubit>();
                    showCustomBottomSheet(
                      context,
                      BlocProvider.value(
                        value: cubit,
                        child: EditNote(note: state.notes[index]),
                      ),
                    );
                  },
                  child: NoteItem(note: state.notes[index]),
                ),
              );
            },
          );
        } else if (state is GetNotesFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManageNotesCubit>().getNotes();
            },
          );
        } else {
          if (state is DeleteNoteFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          } else if (state is DeleteNoteSuccess) {
            InfoBox.customSnackBar(context, "Note deleted successfully.");
          } else if (state is AddNoteFailure) {
            InfoBox.customSnackBar(context, state.errMessage);
          }
          return Skeletonizer(
            child: NotesListView(
              itemBuilder: (context, index) {
                return NoteItem(note: getDummyNotes()[index]);
              },
              notesList: getDummyNotes(),
            ),
          );
        }
      },
    );
  }
}
