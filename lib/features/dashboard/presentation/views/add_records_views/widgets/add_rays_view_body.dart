import 'dart:io';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/validators/app_validators.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/core/widgets/image_input/images_list_view_widget.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_rays_cubit/add_rays_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'diagnosis_field.dart';
import 'doctor_name_field.dart';
import 'examination_date_box.dart';
import 'radiology_center_field.dart';

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
  List<File> images = [];

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
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          DoctorNameField(doctorNameController: doctorNameController),
          RadiologyCenterField(
            radiologyCenterController: radiologyCenterController,
          ),
          DiagnosisField(diagnosisController: diagnosisController),
          8.verticalSpacing,
          CustomDropdownSearch(
            hint: context.tr('rays_type'),
            label: context.tr('rays_type'),
            list: raysTypesList.map((e) => context.tr(e)).toList(),
            onChanged: (localizedValue) {
              setState(() {
                raysType = raysTypesList.firstWhere(
                  (englishKey) => context.tr(englishKey) == localizedValue,
                  orElse: () => context.tr('other'),
                );
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
                  InfoBox.infoFloatingBox(
                    context,
                    context.tr("please_select_image"),
                  );
                  return;
                }
                RaysEntity rays = RaysEntity(
                  raysType: raysType,
                  doctorName: doctorNameController.text,
                  radiologyCenter: radiologyCenterController.text.nullIfEmpty,
                  diagnosis: diagnosisController.text.nullIfEmpty,
                  examinationDate: examinationDate == null
                      ? DateTime.now().toString()
                      : examinationDate.toString(),
                  images: images,
                );
                await context.read<AddRaysCubit>().addRays(rays: rays);
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              context.tr("add_rays"),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: SpacingConstants.bottomPadding),
        ],
      ),
    );
  }
}
