import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_menu.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/custom_icon_button_row.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/reminder_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMedicineViewBody extends StatefulWidget {
  const AddMedicineViewBody({super.key});

  @override
  State<AddMedicineViewBody> createState() => _AddMedicineViewBodyState();
}

class _AddMedicineViewBodyState extends State<AddMedicineViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController medicineUsageController = TextEditingController();
  final TextEditingController timesNumberController = TextEditingController();
  bool isReminderActive = false;
  late final MedicineUsage? medicineUsage;
  late final MedicineTypes? medicineTypes;
  DateTime? pickedDate;
  TimeOfDay? startReminderTime;

  @override
  void dispose() {
    medicineNameController.dispose();
    medicineUsageController.dispose();
    timesNumberController.dispose();
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
              Text("Add Medicine", style: Styles.style33),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 8),
                CustomTextFormField(
                  controller: medicineNameController,
                  label: "Medicine Name",
                  hint: "Enter Medicine Name",
                  validation: (value) => nameValidator(value, context),
                ),
                CustomTextFormField(
                  controller: timesNumberController,
                  label: "Times Number",
                  hint: "Enter the number of times daily",
                  keyboard: TextInputType.numberWithOptions(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  validation: medicineTimesValidator,
                ),
                CustomTextFormField(
                  controller: medicineUsageController,
                  label: "Medicine Usage",
                  maxLines: 3,
                  validation: (value) => nameValidator(value, context),
                ),
                CustomDropdownMenu(
                  hint: 'Use of Medicine',
                  list: MedicineUsage.values.map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(e.name.toUpperCase(), style: Styles.style16),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      medicineUsage = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                CustomDropdownMenu(
                  hint: 'Medicine Types',
                  list: MedicineTypes.values.map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(e.name, style: Styles.style16),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      medicineTypes = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                ReminderToggleSwitch(
                  isReminderEnabled: isReminderActive,
                  onChanged: (newVal) {
                    setState(() {
                      isReminderActive = newVal;
                    });
                  },
                ),
                SizedBox(height: 16),
                CustomIconButtonRow(
                  text1: 'Examination date: ',
                  text2: pickedDate != null
                      ? '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}'
                      : 'Pick a Date',
                  icon: Icons.date_range_outlined,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2016),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      setState(() {
                        pickedDate = value;
                      });
                    });
                  },
                ),
                SizedBox(height: 16),
                GlobalImageInput(onSelectedImage: (image) {}),
                SizedBox(height: 32),
                CustomButton(
                  onPressed: () {},
                  backgroundColor: kNavyColor,
                  child: Text("Add Medicine", style: Styles.styleWhite20),
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
