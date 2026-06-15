import 'dart:io';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/core/widgets/image_input/images_list_view_widget.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_analysis_cubit/add_analysis_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'diagnosis_field.dart';
import 'doctor_name_field.dart';
import 'examination_date_box.dart';
import 'lab_field.dart';

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
          DoctorNameField(doctorNameController: doctorNameController),
          LabField(labController: labController),
          DiagnosisField(diagnosisController: diagnosisController),
          8.verticalSpacing,
          CustomDropdownSearch(
            hint: context.tr('select_analysis_type'),
            label: context.tr('analysis_type'),
            list: analysisTypesList.map((e) => context.tr(e)).toList(),
            onChanged: (localizedValue) {
              analysisType = analysisTypesList.firstWhere(
                (englishKey) => englishKey.tr() == localizedValue,
                orElse: () => context.tr('other'),
              );
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
                  InfoBox.infoFloatingBox(
                    context,
                    context.tr("please_select_image"),
                  );
                  return;
                }
                AnalysisEntity analysis = AnalysisEntity(
                  analysisType: analysisType,
                  doctorName: doctorNameController.text,
                  lab: labController.text.nullIfEmpty,
                  diagnosis: diagnosisController.text.nullIfEmpty,
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
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              context.tr("add_analysis"),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: SpacingConstants.bottomPadding),
        ],
      ),
    );
  }
}
