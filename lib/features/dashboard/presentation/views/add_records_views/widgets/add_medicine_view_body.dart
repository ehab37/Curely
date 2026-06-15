import 'dart:developer';
import 'dart:io';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/get_default_reminders_list.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curely/core/services/local_notifications_service.dart';
import 'frequency_field.dart';
import 'medicine_name_field.dart';
import 'medicine_notes_field.dart';
import 'medicine_type_field.dart';
import 'medicine_usage_field.dart';
import 'reminder_toggle_switch.dart';

class AddMedicineViewBody extends StatefulWidget {
  const AddMedicineViewBody({super.key});

  @override
  State<AddMedicineViewBody> createState() => _AddMedicineViewBodyState();
}

class _AddMedicineViewBodyState extends State<AddMedicineViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController medicineNotesController = TextEditingController();
  bool isReminderActive = false;
  String? frequency;
  late String medicineUsage;
  late String medicineTypes;
  File? image;

  @override
  void dispose() {
    medicineNameController.dispose();
    medicineNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AddMedicineCubit addMedicineCubit = context.read<AddMedicineCubit>();
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          MedicineNameField(medicineNameController: medicineNameController),
          MedicineNotesField(medicineNotesController: medicineNotesController),
          8.verticalSpacing,
          FrequencyField(
            onChanged: (localizedValue) {
              setState(() {
                addMedicineCubit.remindersList = getDefaultRemindersList(
                  localizedValue,
                );
                frequency = frequencyList.firstWhere(
                  (englishKey) => context.tr(englishKey) == localizedValue,
                  orElse: () => context.tr('other'),
                );
              });
            },
          ),
          16.verticalSpacing,
          MedicineUsageField(
            onChanged: (localizedValue) {
              setState(() {
                medicineUsage = medicineUsagesList.firstWhere(
                  (englishKey) => context.tr(englishKey) == localizedValue,
                  orElse: () => context.tr('other'),
                );
              });
            },
          ),
          16.verticalSpacing,
          MedicineTypeField(
            onChanged: (localizedValue) {
              setState(() {
                medicineTypes = medicineTypesList.firstWhere(
                  (englishKey) => context.tr(englishKey) == localizedValue,
                  orElse: () => context.tr('other'),
                );
              });
            },
          ),
          16.verticalSpacing,
          ReminderToggleSwitch(
            isReminderEnabled: isReminderActive,
            onChangedToggle: (newVal) async {
              setState(() {
                if (frequency == null) {
                  InfoBox.errorFloatingBox(
                    context,
                    context.tr("choose_frequency_first"),
                  );
                  return;
                }
                isReminderActive = newVal;
              });
              if (await LocalNotificationsService.requestPermissions(context)) {
                log('permission approved');
              }
            },
            remindersList: addMedicineCubit.remindersList,
          ),
          16.verticalSpacing,
          GlobalImageInput(
            imageFile: image,
            onSelectedImage: (value) {
              setState(() {
                image = value;
              });
            },
          ),
          32.verticalSpacing,
          CustomButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                MedicineEntity medicine = MedicineEntity(
                  medicineUsage: medicineUsage,
                  medicineName: medicineNameController.text,
                  frequency: frequency!,
                  medicineNotes: medicineNotesController.text.nullIfEmpty,
                  isReminderActive: isReminderActive,
                  medicineTypes: medicineTypes,
                  image: image,
                );
                await addMedicineCubit.addMedicine(medicine: medicine);
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              context.tr("add_medicine"),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(height: SpacingConstants.bottomPadding),
        ],
      ),
    );
  }
}
