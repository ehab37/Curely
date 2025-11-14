import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_menu.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/examination_date_box.dart';
import 'package:flutter/material.dart';

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
  late final AnalysisTypes? analysisType;
  DateTime? examinationDate;

  @override
  void dispose() {
    doctorNameController.dispose();
    labController.dispose();
    diagnosisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            children: [
              CustomBackBar(),
              Text("Add Analysis", style: Styles.style33),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 8),
                CustomTextFormField(
                  controller: doctorNameController,
                  label: "Doctor Name",
                  hint: "Enter Doctor Name",
                  validation: (value) => nameValidator(value, context),
                ),
                CustomTextFormField(
                  controller: labController,
                  label: "Lab",
                  hint: "Enter Lab Name",
                  validation: (value) => nameValidator(value, context),
                ),
                CustomTextFormField(
                  controller: diagnosisController,
                  label: "Diagnosis",
                  maxLines: 3,
                  validation: (value) => nameValidator(value, context),
                ),
                CustomDropdownMenu(
                  hint: 'Analysis Type',
                  list: AnalysisTypes.values.map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(e.name.toUpperCase(), style: Styles.style16),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      analysisType = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                ExaminationDateBox(onChanged: (value){
                  setState(() {
                    examinationDate = value;
                  });
                }),
                SizedBox(height: 16),
                GlobalImageInput(onSelectedImage: (image) {}),
                SizedBox(height: 32),
                CustomButton(
                  onPressed: () {},
                  backgroundColor: kNavyColor,
                  child: Text("Add Analysis", style: Styles.styleWhite20),
                ),
                SizedBox(height: kBottomPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
