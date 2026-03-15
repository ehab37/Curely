import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                    style: Styles.styleBlue20,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      isEditable ? Icons.save : Icons.edit,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      if (isEditable) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final updatedNote = widget.note
                            ..description = descriptionController.text;
                          context.read<ManageNotesCubit>().updateNote(
                            note: updatedNote,
                          );
                          GoRouter.of(context).pop();
                        }
                      }
                      setState(() {
                        isEditable = !isEditable;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outlined, color: AppColors.primary),
                    onPressed: () {
                      showAlertDialog(
                        context: context,
                        content: CustomAlertDialog(
                          dialogContext: context,
                          title: 'Delete Note?',
                          content: 'Are you sure you want to delete this Note?',
                          onDone: () {
                            context.read<ManageNotesCubit>().deleteNote(
                              docId: widget.note.docId!,
                            );
                            GoRouter.of(context).pop();
                            GoRouter.of(context).pop();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              20.verticalSpacing,
              CustomTextFormField(
                controller: titleController,
                label: 'Title',
                enabled: false,
              ),
              8.verticalSpacing,
              CustomTextFormField(
                controller: descriptionController,
                label: 'Description',
                validator: (value) => AppValidators.validateRequired(value),
                enabled: isEditable,
                maxLines: 8,
              ),
              20.verticalSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
