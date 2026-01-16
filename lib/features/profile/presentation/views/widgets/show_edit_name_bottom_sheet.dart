import 'package:curely/constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showEditNameBottomSheet(BuildContext context, UserEntity user) {
  final nameController = TextEditingController(text: user.name);
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (bottomSheetContext) {
      return Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Edit Your Name', style: Styles.styleBlue20),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: nameController,
                label: S.of(context).name,
                hint: S.of(context).enterYourName,
                keyboard: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                validator: (value) => nameValidator(value, context),
                autoFocus: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                backgroundColor: kNavyColor,
                child: Text('Save', style: Styles.styleWhite20),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<EditProfileCubit>().editProfile(
                      user: user..name = nameController.text,
                    );
                    Navigator.pop(bottomSheetContext);
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
