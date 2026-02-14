import 'dart:io';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/core/widgets/image_input/images_list_view_widget.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_analysis_cubit/add_analysis_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/examination_date_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<File> images = [];

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
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          8.verticalSpacing,
          CustomTextFormField(
            controller: doctorNameController,
            label: "Doctor Name",
            hint: "Enter Doctor Name",
            keyboard: TextInputType.name,
            validator: (value) => AppValidators.validateName(value),
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
          8.verticalSpacing,
          CustomDropdownSearch(
            hint: 'Analysis Type',
            label: 'Analysis Type',
            list: analysisTypesList,
            onChanged: (value) {
              setState(() {
                analysisType = value;
              });
            },
            validator: (value) => AppValidators.validateRequired(value),
          ),
          16.verticalSpacing,
          ExaminationDateBox(
            onChanged: (value) {
              setState(() {
                examinationDate = value;
              });
            },
          ),
          16.verticalSpacing,
          ImagesListViewWidget(images: images),
          GlobalImageInput(
            isMultiple: true,
            onSelectedImage: (value) {
              setState(() {
                images.add(value!);
              });
            },
          ),
          32.verticalSpacing,
          CustomButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                if (images.isEmpty) {
                  InfoBox.customSnackBar(context, "Please select an image");
                  return;
                }
                AnalysisEntity analysis = AnalysisEntity(
                  analysisType: analysisType,
                  doctorName: doctorNameController.text,
                  lab: labController.text,
                  diagnosis: diagnosisController.text,
                  examinationDate: examinationDate == null
                      ? DateTime.now().toString()
                      : examinationDate.toString(),
                  images: images,
                );
                await context.read<AddAnalysisCubit>().addAnalysis(
                  analysis: analysis,
                );
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            backgroundColor: AppColors.buttonAccent,
            child: Text("Add Analysis", style: Styles.styleWhite20),
          ),
          SizedBox(height: SpacingConstants.bottomPadding),
        ],
      ),
    );
  }
}
