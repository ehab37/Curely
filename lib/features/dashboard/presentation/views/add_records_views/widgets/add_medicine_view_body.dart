import 'dart:developer';
import 'dart:io';
import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/get_default_reminders_list.dart';
import 'package:curely/core/helper_functions/info_box.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/reminder_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curely/core/services/notification_service.dart';

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
      child: Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 8),
            CustomTextFormField(
              controller: medicineNameController,
              label: "Medicine Name",
              hint: "Enter Medicine Name",
              keyboard: TextInputType.name,
              validator: (value) => nameValidator(value, context),
            ),
            CustomTextFormField(
              controller: medicineNotesController,
              label: "Medicine Notes",
              hint: "Please, Enter any missing information about the medicine.",
              maxLines: 3,
            ),
            SizedBox(height: 8),
            CustomDropdownSearch(
              hint: 'How Often?',
              label: "Frequency",
              showSearchBox: false,
              list: frequencyList,
              onChanged: (value) {
                setState(() {
                  addMedicineCubit.remindersList = getDefaultRemindersList(
                    value,
                  );
                  frequency = value;
                });
              },
              validator: (selectedValue) => dropdownValidator(selectedValue),
            ),
            SizedBox(height: 16),
            CustomDropdownSearch(
              label: "Medicine Usage",
              hint: "Enter Medicine Usage",
              list: medicineUsagesList,
              onChanged: (value) {
                setState(() {
                  medicineUsage = value;
                });
              },
              validator: (selectedValue) => dropdownValidator(selectedValue),
            ),
            SizedBox(height: 16),
            CustomDropdownSearch(
              label: 'Medicine Type',
              hint: 'Enter Medicine Type',
              list: medicineTypesList,
              onChanged: (value) {
                setState(() {
                  medicineTypes = value;
                });
              },
              validator: (selectedValue) => dropdownValidator(selectedValue),
            ),
            SizedBox(height: 16),
            ReminderToggleSwitch(
              isReminderEnabled: isReminderActive,
              onChangedToggle: (newVal) async {
                setState(() {
                  if (frequency == null) {
                    InfoBox.customSnackBar(
                      context,
                      "Please, Choose the frequency first.",
                    );
                    return;
                  }
                  isReminderActive = newVal;
                });
                if (await NotificationService.requestPermissions(context)) {
                  log('permission approved');
                }
              },
              remindersList: addMedicineCubit.remindersList,
            ),
            SizedBox(height: 16),
            GlobalImageInput(
              imageFile: image,
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
                  MedicineEntity medicine = MedicineEntity(
                    medicineUsage: medicineUsage,
                    medicineName: medicineNameController.text,
                    frequency: frequency!,
                    medicineNotes: medicineNotesController.text,
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
              backgroundColor: kNavyColor,
              child: Text("Add Medicine", style: Styles.styleWhite20),
            ),
            SizedBox(height: kBottomPadding),
          ],
        ),
      ),
    );
  }
}
