import 'dart:developer';
import 'dart:io';
import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_search.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/reminder_toggle_switch.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddMedicineViewBody extends StatefulWidget {
  const AddMedicineViewBody({super.key});

  @override
  State<AddMedicineViewBody> createState() => _AddMedicineViewBodyState();
}

class _AddMedicineViewBodyState extends State<AddMedicineViewBody> {
  final GlobalKey<DropdownSearchState<String>> dropDownKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController medicineNotesController = TextEditingController();
  bool isReminderActive = false;
  late String frequency;
  late String medicineUsage;
  late String medicineTypes;
  List<TimeOfDay?> remindersList = [];
  File? image;

  @override
  void dispose() {
    medicineNameController.dispose();
    medicineNotesController.dispose();
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
              dropDownKey: dropDownKey,
              hint: 'How Often?',
              label: "Frequency",
              showSearchBox: false,
              list: frequencyList,
              onChanged: (value) {
                setState(() {
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
              reminders:
                  dropDownKey.currentState?.getSelectedItem ?? 'Once Daily',
              isReminderEnabled: isReminderActive,
              onChangedToggle: (newVal) {
                setState(() {
                  isReminderActive = newVal;
                });
              },
              onChangedReminders: (list) {
                remindersList = list;
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
                  try {
                    MedicineEntity medicine = MedicineEntity(
                      medicineUsage: medicineUsage,
                      medicineName: medicineNameController.text,
                      frequency: frequency,
                      medicineNotes: medicineNotesController.text,
                      isReminderActive: isReminderActive,
                      medicineTypes: medicineTypes,
                      image: image,
                      remindersTime: remindersList,
                    );
                    setState(() {
                      medicineItems.add(medicine);
                    });
                    GoRouter.of(context).pop();
                    log("success");
                  } catch (e) {
                    log(e.toString());
                  }
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
