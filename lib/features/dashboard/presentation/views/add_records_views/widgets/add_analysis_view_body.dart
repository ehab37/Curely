import 'dart:io';

import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/examination_date_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddAnalysisViewBody extends StatefulWidget {
  const AddAnalysisViewBody({super.key});

  @override
  State<AddAnalysisViewBody> createState() => _AddAnalysisViewBodyState();
}

class _AddAnalysisViewBodyState extends State<AddAnalysisViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController labController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  late String analysisType;
  DateTime? examinationDate;
  File? image;

  @override
  void dispose() {
    doctorNameController.dispose();
    labController.dispose();
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
              controller: labController,
              label: "Lab",
              hint: "Enter Lab Name",
            ),
            CustomTextFormField(
              controller: diagnosisController,
              label: "Diagnosis",
              maxLines: 3,
            ),
            SizedBox(height: 8),
            CustomDropdownSearch(
              hint: 'Analysis Type',
              label: 'Analysis Type',
              list: analysisTypesList,
              onChanged: (value) {
                setState(() {
                  analysisType = value;
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
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  if (image == null) {
                    InfoBox.customSnackBar(context, "Please select an image");
                    return;
                  }
                  AnalysisEntity analysis = AnalysisEntity(
                    analysisType: analysisType,
                    doctorName: doctorNameController.text,
                    lab: labController.text,
                    diagnosis: diagnosisController.text,
                    examinationDate: examinationDate ?? DateTime.now(),
                    image: image!,
                  );
                  analysisItems.add(analysis);
                  GoRouter.of(context).pop();
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: kNavyColor,
              child: Text("Add Analysis", style: Styles.styleWhite20),
            ),
            SizedBox(height: kBottomPadding),
          ],
        ),
      ),
    );
  }
}
