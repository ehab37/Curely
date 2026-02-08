import 'dart:developer';
import 'package:curely/core/constants/app_text_constants.dart';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/spacing.dart';
import 'package:curely/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/birth_date_box.dart';
import 'package:curely/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDetailsBottomSheetBody extends StatefulWidget {
  const UpdateDetailsBottomSheetBody({super.key, required this.user});

  final UserEntity user;

  @override
  State<UpdateDetailsBottomSheetBody> createState() =>
      _UpdateDetailsBottomSheetBodyState();
}

class _UpdateDetailsBottomSheetBodyState
    extends State<UpdateDetailsBottomSheetBody> {
  late final TextEditingController nameController;
  late final TextEditingController bloodController;
  late final TextEditingController heightController;
  late final TextEditingController weightController;
  final formKey = GlobalKey<FormState>();
  DateTime? dateOfBirth;

  @override
  void initState() {
    super.initState();
    final user = widget.user;
    nameController = TextEditingController(text: user.name);
    bloodController = TextEditingController(text: user.blood);
    heightController = TextEditingController(text: user.height?.toString());
    weightController = TextEditingController(text: user.weight?.toString());
    if (user.dateOfBirth != null && user.dateOfBirth!.isNotEmpty) {
      try {
        dateOfBirth = DateTime.parse(user.dateOfBirth!);
      } catch (e) {
        log('Error parsing dateOfBirth: $e');
        dateOfBirth = null;
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    bloodController.dispose();
    heightController.dispose();
    weightController.dispose();
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
              Text('Edit Your Details', style: Styles.styleBlue20),
              20.verticalSpacing,
              CustomTextFormField(
                controller: nameController,
                label: S.of(context).name,
                hint: S.of(context).enterYourName,
                keyboard: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                validator: (value) => AppValidators.validateName(value),
                autoFocus: true,
              ),
              8.verticalSpacing,
              CustomTextFormField(
                controller: bloodController,
                label: 'Blood Type',
                hint: 'e.g., A+',
                textCapitalization: TextCapitalization.characters,
                validator: (value) => AppValidators.validateBloodType(value),
              ),
              8.verticalSpacing,
              CustomTextFormField(
                controller: heightController,
                label: 'Height (cm)',
                hint: 'e.g., 175',
                keyboard: TextInputType.number,
                validator: (value) => AppValidators.validateNumberLength(
                  value,
                  AppTextConstants.height,
                ),
              ),
              8.verticalSpacing,
              CustomTextFormField(
                controller: weightController,
                label: 'Weight (kg)',
                hint: 'e.g., 70',
                keyboard: TextInputType.number,
                validator: (value) => AppValidators.validateNumberLength(
                  value,
                  AppTextConstants.weight,
                ),
              ),
              8.verticalSpacing,
              BirthDateBox(
                onChanged: (value) {
                  setState(() {
                    dateOfBirth = value;
                  });
                },
              ),
              20.verticalSpacing,
              CustomButton(
                backgroundColor: AppColors.buttonAccent,
                child: Text('Save', style: Styles.styleWhite20),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final updatedUser = widget.user
                      ..name = nameController.text
                      ..blood = bloodController.text
                      ..height = int.tryParse(heightController.text)
                      ..weight = int.tryParse(weightController.text)
                      ..dateOfBirth = dateOfBirth.toString();
                    log(dateOfBirth.toString());
                    context.read<EditProfileCubit>().editProfile(
                      user: updatedUser,
                    );
                    Navigator.pop(context);
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
