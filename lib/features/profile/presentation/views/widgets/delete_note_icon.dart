import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteNoteIcon extends StatelessWidget {
  const DeleteNoteIcon({super.key, required this.note});

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete_outlined),
      onPressed: () {
        showAlertDialog(
          context: context,
          content: CustomAlertDialog(
            dialogContext: context,
            title: context.tr("delete_note"),
            content: context.tr("confirm_delete_note"),
            onDone: () {
              context.read<ManageNotesCubit>().deleteNote(docId: note.docId!);
              GoRouter.of(context).pop();
              GoRouter.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
