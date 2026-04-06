import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/records_dismissible_widget.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_note.dart';
import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.notesList});

  final List notesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notesList.length,
      itemBuilder: (context, index) {
        return RecordsDismissibleWidget(
          recordKey: notesList[index].docId!,
          onDismissed: (direction) {
            context.read<ManageNotesCubit>().deleteNote(
              docId: notesList[index].docId!,
            );
          },
          content: GestureDetector(
            onTap: () {
              ManageNotesCubit cubit = context.read<ManageNotesCubit>();
              showCustomBottomSheet(
                context,
                BlocProvider.value(
                  value: cubit,
                  child: EditNote(note: notesList[index]),
                ),
              );
            },
            child: NoteItem(note: notesList[index]),
          ),
        );
      },
    );
  }
}
