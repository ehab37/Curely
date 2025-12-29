import 'dart:io';
import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_rays_cubit/add_rays_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'examination_date_box.dart';

class AddRaysViewBody extends StatefulWidget {
  const AddRaysViewBody({super.key});

  @override
  State<AddRaysViewBody> createState() => _AddRaysViewBodyState();
}

class _AddRaysViewBodyState extends State<AddRaysViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController radiologyCenterController =
      TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  late String raysType;
  DateTime? examinationDate;
  File? image;

  @override
  void dispose() {
    doctorNameController.dispose();
    radiologyCenterController.dispose();
    diagnosisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 8),
            CustomTextFormField(
              controller: doctorNameController,
              label: "Doctor Name",
              hint: "Enter Doctor Name",
              keyboard: TextInputType.name,
              validator: (value) => nameValidator(value, context),
            ),
            CustomTextFormField(
              controller: radiologyCenterController,
              label: "Radiology Center",
              hint: "Enter Radiology Center Name",
            ),
            CustomTextFormField(
              controller: diagnosisController,
              label: "Diagnosis",
              maxLines: 3,
            ),
            SizedBox(height: 8),
            CustomDropdownSearch(
              hint: 'Rays Type',
              label: 'Rays Type',
              list: raysTypesList,
              onChanged: (value) {
                setState(() {
                  raysType = value;
                });
              },
              validator: (selectedValue) => dropdownValidator(selectedValue),
            ),
            SizedBox(height: 16),
            ExaminationDateBox(
              onChanged: (value) {
                setState(() {
                  examinationDate = value;
                });
              },
            ),
            SizedBox(height: 16),
            GlobalImageInput(
              onSelectedImage: (value) {
                setState(() {
                  image = value;
                });
              },
            ),
            SizedBox(height: 32),
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (image == null) {
                    InfoBox.customSnackBar(context, "Please select an image");
                    return;
                  }
                  RaysEntity rays = RaysEntity(
                    raysType: raysType,
                    doctorName: doctorNameController.text,
                    radiologyCenter: radiologyCenterController.text,
                    diagnosis: diagnosisController.text,
                    examinationDate: examinationDate == null
                        ? DateTime.now().toString()
                        : examinationDate.toString(),
                    image: image!,
                  );
                  await context.read<AddRaysCubit>().addRays(rays: rays);
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: kNavyColor,
              child: Text("Add Rays", style: Styles.styleWhite20),
            ),
            SizedBox(height: kBottomPadding),
          ],
        ),
      ),
    );
  }
}
