import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'delete_note_icon.dart';
import 'description_field.dart';
import 'title_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final NoteEntity note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    final note = widget.note;
    titleController = TextEditingController(text: note.title);
    descriptionController = TextEditingController(text: note.description);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    isEditable ? 'Edit Health Note' : 'My Health Note',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(isEditable ? Icons.save : Icons.edit),
                    onPressed: () {
                      if (isEditable) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (widget.note.description !=
                              descriptionController.text) {
                            final updatedNote = widget.note
                              ..description = descriptionController.text;
                            context.read<ManageNotesCubit>().updateNote(
                              note: updatedNote,
                            );
                            GoRouter.of(context).pop();
                          }
                        }
                      }
                      setState(() {
                        isEditable = !isEditable;
                      });
                    },
                  ),
                  DeleteNoteIcon(note: widget.note),
                ],
              ),
              20.verticalSpacing,
              TitleField(titleController: titleController),
              8.verticalSpacing,
              DescriptionField(
                descriptionController: descriptionController,
                isEditable: isEditable,
              ),
              20.verticalSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
