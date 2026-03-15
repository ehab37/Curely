import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_form_field.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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
              16.verticalSpacing,
              Text('Add Note', style: Styles.styleBlue20),
              20.verticalSpacing,
              CustomTextFormField(
                controller: titleController,
                label: 'Title',
                hint: 'Enter the title',
                keyboard: TextInputType.name,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                textCapitalization: TextCapitalization.words,
                validator: (value) => AppValidators.validateRequired(value),
              ),
              8.verticalSpacing,
              CustomTextFormField(
                controller: descriptionController,
                label: 'Description',
                validator: (value) => AppValidators.validateRequired(value),
                maxLines: 5,
              ),
              20.verticalSpacing,
              CustomButton(
                backgroundColor: AppColors.buttonAccent,
                child: Text('Save', style: Styles.styleWhite20),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final note = NoteEntity(
                      title: titleController.text,
                      description: descriptionController.text,
                    );
                    context.read<ManageNotesCubit>().addNote(note: note);
                    GoRouter.of(context).pop();
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              20.verticalSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
