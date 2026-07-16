import 'dart:io';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_prescription_cubit/add_prescription_cubit.dart';
import 'package:curely/core/widgets/image_input/images_list_view_widget.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/next_appointment_date_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'diagnosis_field.dart';
import 'doctor_name_field.dart';
import 'examination_date_box.dart';
import 'hospital_field.dart';

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
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DoctorNameField(doctorNameController: doctorNameController),
          HospitalField(hospitalController: hospitalController),
          DiagnosisField(diagnosisController: diagnosisController),
          8.verticalSpacing,
          CustomDropdownSearch(
            hint: context.tr('select_doctor_specialization'),
            label: context.tr('doctor_specialization'),
            list: doctorSpecializationsList.map((e) => context.tr(e)).toList(),
            onChanged: (localizedValue) {
              doctorSpecialization = doctorSpecializationsList.firstWhere(
                (englishKey) => context.tr(englishKey) == localizedValue,
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
          NextAppointmentDateBox(),
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
                PrescriptionEntity prescription = PrescriptionEntity(
                  doctorName: doctorNameController.text,
                  doctorSpecialization: doctorSpecialization,
                  hospital: hospitalController.text.nullIfEmpty,
                  diagnosis: diagnosisController.text.nullIfEmpty,
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
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              context.tr("add_prescription"),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: SpacingConstants.bottomPadding),
        ],
      ),
    );
  }
}
