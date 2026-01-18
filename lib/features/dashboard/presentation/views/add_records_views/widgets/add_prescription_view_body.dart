import 'dart:io';
import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_prescription_cubit/add_prescription_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/images_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'examination_date_box.dart';

class AddPrescriptionViewBody extends StatefulWidget {
  const AddPrescriptionViewBody({super.key});

  @override
  State<AddPrescriptionViewBody> createState() =>
      _AddPrescriptionViewBodyState();
}

class _AddPrescriptionViewBodyState extends State<AddPrescriptionViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  late String doctorSpecialization;
  DateTime? examinationDate;
  List<File> images = [];

  @override
  void dispose() {
    doctorNameController.dispose();
    hospitalController.dispose();
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
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: doctorNameController,
              label: "Doctor Name",
              hint: "Enter Doctor Name",
              keyboard: TextInputType.name,
              validator: (value) => nameValidator(value, context),
            ),
            CustomTextFormField(
              controller: hospitalController,
              label: "Hospital or Clinic",
              hint: "Enter the place of examination",
            ),
            CustomTextFormField(
              controller: diagnosisController,
              label: "Diagnosis",
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            CustomDropdownSearch(
              hint: 'Doctor Specialization',
              label: 'Doctor Specialization',
              list: doctorSpecializationsList,
              onChanged: (value) {
                setState(() {
                  doctorSpecialization = value;
                });
              },
              validator: (selectedValue) => dropdownValidator(selectedValue),
            ),
            const SizedBox(height: 16),
            ExaminationDateBox(
              onChanged: (value) {
                setState(() {
                  examinationDate = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ImagesListViewWidget(images: images),
            GlobalImageInput(
              isMultiple: true,
              onSelectedImage: (value) {
                setState(() {
                  images.add(value!);
                });
              },
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (images.isEmpty) {
                    InfoBox.customSnackBar(context, "Please select an image");
                    return;
                  }
                  PrescriptionEntity prescription = PrescriptionEntity(
                    doctorName: doctorNameController.text,
                    doctorSpecialization: doctorSpecialization,
                    hospital: hospitalController.text,
                    diagnosis: diagnosisController.text,
                    examinationDate: examinationDate == null
                        ? DateTime.now().toString()
                        : examinationDate.toString(),
                    images: images,
                  );
                  await context.read<AddPrescriptionCubit>().addPrescription(
                    prescription: prescription,
                  );
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: kNavyColor,
              child: Text("Add Prescription", style: Styles.styleWhite20),
            ),
            SizedBox(height: kBottomPadding),
          ],
        ),
      ),
    );
  }
}
