import 'dart:developer';
import 'package:curely/core/entities/user_entity.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/profile/presentation/cubits/manage_profile_cubit/manage_profile_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/birth_date_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blood_field.dart';
import 'height_field.dart';
import 'name_field.dart';
import 'weight_field.dart';

class UpdateUserDetails extends StatefulWidget {
  const UpdateUserDetails({super.key, required this.user});

  final UserEntity user;

  @override
  State<UpdateUserDetails> createState() => _UpdateUserDetailsState();
}

class _UpdateUserDetailsState extends State<UpdateUserDetails> {
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
              Text(
                'Edit Your Details',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              20.verticalSpacing,
              NameField(nameController: nameController),
              8.verticalSpacing,
              BloodField(bloodController: bloodController),
              8.verticalSpacing,
              HeightField(heightController: heightController),
              8.verticalSpacing,
              WeightField(weightController: weightController),
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
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final updatedUser = widget.user
                      ..name = nameController.text
                      ..blood = bloodController.text
                      ..height = int.tryParse(heightController.text)
                      ..weight = int.tryParse(weightController.text)
                      ..dateOfBirth = dateOfBirth.toString();
                    context.read<ManageProfileCubit>().editProfile(
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
