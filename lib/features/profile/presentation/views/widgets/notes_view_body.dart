import 'package:curely/core/helpers/get_dummy_data.dart';
import 'package:curely/core/widgets/custom_empty_widget.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_error_widget.dart';
import 'package:curely/core/widgets/custom_skeletonizer.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/notes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            return widget.isFavoriteView
                ? CustomEmptyWidget(title: "NO Favorite Notes Yet !...")
                : CustomEmptyWidget(
                    title: "No Notes Found",
                    subTitle: "You haven't added any notes yet!...",
                  );
          }
          return NotesListView(notesList: state.notes);
        } else if (state is GetNotesFailure) {
          return CustomErrorWidget(
            error: state.errMessage,
            onTryAgain: () {
              context.read<ManageNotesCubit>().getNotes();
            },
          );
        } else {
          if (state is DeleteNoteFailure) {
            InfoBox.errorFloatingBox(context, state.errMessage);
          } else if (state is DeleteNoteSuccess) {
            InfoBox.successFloatingBox(context, "Note deleted successfully.");
          } else if (state is AddNoteFailure) {
            InfoBox.errorFloatingBox(context, state.errMessage);
          }
          return CustomSkeletonizer(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NoteItem(note: getDummyNotes()[index]);
              },
              itemCount: getDummyNotes().length,
            ),
          );
        }
      },
    );
  }
}
